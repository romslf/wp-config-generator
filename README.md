# wp-config-generator
A simple **Wordpress** config generator using environment variables.

The script will generate a working **wp-config.php** file to your desired location.
It will fill database informations using environments variables while Salts/Keys are generated using **openssl** random Base64 values, like `e3Gg6vj8GFO3ksXtlLx/qufX7uwxyFMS7xG2EBHLNEg=`.

## Usage
`sh generate.sh`
`sh generate.sh /path/to/wordpress`

The script will need a few environement variables to be able to generate your config file.
- DB_NAME
- DB_USER
- DB_PASS
- DB_HOST
- TABLE_PREFIX (Optional. Default: wp_)
- SALTS_SIZE (Optional. Default/Min: 64)

If you don't set it properly, it will tell you which one is missing.

### Screenshots

![Success](https://github.com/romslf/wp-config-generator/blob/main/Capture-Success.PNG?raw=true)
![Fail](https://github.com/romslf/wp-config-generator/blob/main/Capture-Fail.PNG?raw=true)
