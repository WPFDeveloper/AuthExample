using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AuthProj
{
    /// <summary>
    /// Логика взаимодействия для PageRegistration.xaml
    /// </summary>
    public partial class PageRegistration : Page
    {
        public PageRegistration()
        {
            InitializeComponent();
        }

        private void buttonRegistration_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(textBoxEmail.Text) || string.IsNullOrEmpty(passwordBox.Password) || string.IsNullOrEmpty(textBoxLogin.Text) || string.IsNullOrEmpty(textBoxName.Text)
                || string.IsNullOrEmpty(textBoxPatronymic.Text) || string.IsNullOrEmpty(textBoxPhone.Text) || string.IsNullOrEmpty(textBoxSurname.Text))
            {
                MessageBox.Show("Заполните все поля", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            } else if (!isUniqueLogin(textBoxLogin.Text))
            {
                MessageBox.Show("Этот логин уже занят", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            } else if (!isValidPhone(textBoxPhone.Text))
            {
                MessageBox.Show("Введите корректый номер телефона", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (!isValidEmail(textBoxEmail.Text))
            {
                MessageBox.Show("Введите корректый email", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                ExamDBEntities.GetContext().AddUser(textBoxLogin.Text, passwordBox.Password, textBoxSurname.Text, textBoxName.Text, textBoxPatronymic.Text,
                    textBoxPhone.Text, textBoxEmail.Text);

                MessageBox.Show("Успешная регистрация", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);

                Manager.MainFrame.GoBack();
            }
        }

        private bool isValidEmail(string email)
        {
            string pattern = @"(\S+)@(\S+)\.(\S+)";

            Regex regex = new Regex(pattern);

            return regex.IsMatch(email);
        }

        private bool isValidPhone(string phone)
        {
            string pattern = @"\+7[0-9]{10}";

            Regex regex = new Regex(pattern);

            return regex.IsMatch(phone);
        }

        private bool isUniqueLogin(string login)
        {
            foreach (User user in ExamDBEntities.GetContext().User.ToList()) 
            {
                if (user.Login == login)
                {
                    return false;
                }
            }

            return true;
        }
    }
}
