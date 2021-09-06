# wp-config-generator
A simple **Wordpress** config generator using environment variables.

The script will generate a working **wp-config.php** file to your desired location.
It will fill database informations using environments variables while Salts/Keys are generated using **openssl** random Hex values, like `f181b8615a73bb0d39765c135c4...`.

## Requirements
- Openssl

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

## Notes
- If no wp-config.php is in the given path then the script will generate a default one with the minimum requirements.
- If a wp-config.php file is already in the given path then the script will back it up (As wp-config.php.DATE_TIME) and only replace needed definitions.
- If the given path don't exist, then the config will be created next to the **generate.sh** file.

### Screenshots
![Success](https://github.com/romslf/wp-config-generator/blob/main/Capture-Success.PNG?raw=true)
![Fail](https://github.com/romslf/wp-config-generator/blob/main/Capture-Fail.PNG?raw=true)
