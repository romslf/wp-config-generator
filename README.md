# wp-config-generator
A simple Wordpress config generator (wp-config.php) using environment variables.

## Usage
The script will need a few environement variables to be able to generate your config file.
- DB_NAME
- DB_USER
- DB_PASS
- DB_HOST
- TABLE_PREFIX (Optional. Default: wp_)
- SALTS_SIZE (Optional. Default: 32)

If you don't set it properly, it will tell you which one is missing.

Also it will fill all needed Salts/Keys values automatically, using **openssl** to generate random Base64 values, like `e3Gg6vj8GFO3ksXtlLx/qufX7uwxyFMS7xG2EBHLNEg=`.
- AUTH_KEY
- SECURE_AUTH_KEY
- LOGGED_IN_KEY
- NONCE_KEY
- AUTH_SALT
- SECURE_AUTH_SALT
- LOGGED_IN_SALT
- NONCE_SALT

### Screenshots

![Success](https://github.com/romslf/wp-config-generator/Capture-Success.PNG)
![Fail](https://github.com/romslf/wp-config-generator/Capture-Fail.PNG)
