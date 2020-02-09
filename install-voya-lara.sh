echo "Installing Laravel";
composer create-project --prefer-dist laravel/laravel lara-voya

cd ./lara-voya

echo "Envroment Modifications";
composer require sven/flex-env:dev-master

echo "Installing Voyager";
composer require tcg/voyager
echo "Laravel Key Generation";
php artisan key:generate 
echo "Database creation"; 
read -p "Enter Database User - Name: " db_username
read -p "Enter Database Name: " db_name
echo "";
read -s -p "Enter Database Password: " db_password
echo "";
# echo "";
echo "create database $db_name" | mysql -u $db_username -p

echo "Setting Environment variables !";
php artisan env:set DB_DATABASE "$db_name"
php artisan env:set DB_USERNAME "$db_username"
php artisan env:set DB_PASSWORD "$db_password"
php artisan env:set DB_HOST "127.0.0.1"

echo "Installing Voyager" ; 
composer require tcg/voyager

echo "Installing Voyager DASHBOARD !";
php artisan voyager:install --with-dummy
echo "SERVE IT";
php artisan storage:link
php artisan serve


