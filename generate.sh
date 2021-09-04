#!/bin/sh
NC="\e[39m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[93m"
CYAN="\e[96m"
ENV_CHECK="true"
SALTS_LEN="32"
TAB_PREFIX="wp_"
PWD=$(pwd)

setEnvCheck ()
{
	ENV_CHECK="$1"
}

if [ -z "$DB_HOST" ]
then
	setEnvCheck false
 	echo "[$RED ERROR $NC] Please set DB_HOST env variable."
else
	echo "[$GREEN OK $NC] DB_HOST"
fi

if [ -z "$DB_NAME" ]
then
	setEnvCheck false
	echo "[$RED ERROR $NC] Please set DB_NAME env variable."
else
	echo "[$GREEN OK $NC] DB_NAME"
fi

if [ -z "$DB_USER" ]
then
	setEnvCheck false
	echo "[$RED ERROR $NC] Please set DB_USER env variable."
else
	echo "[$GREEN OK $NC] DB_USER"
fi

if [ -z "$DB_PASS" ]
then
	setEnvCheck false
	echo "[$RED ERROR $NC] Please set DB_PASS env variable."
else
	echo "[$GREEN OK $NC] DB_PASS"
fi

if [ -z "$TABLE_PREFIX" ]
then
	echo "[$CYAN INFO $NC] TABLE_PREFIX: Using default value. ($TAB_PREFIX)"
else
	TAB_PREFIX=$TABLE_PREFIX
	echo "[$GREEN OK $NC] TABLE_PREFIX"
fi

if [ -z "$SALTS_SIZE" ]
then
	echo "[$CYAN INFO $NC] SALTS_SIZE: Using default value. ($SALTS_LEN)"
else
	if [ "$SALTS_SIZE" -lt "30" ]
	then
		echo "[$RED ERROR $NC] SALTS_SIZE should be greater than 30."
		exit 1
	fi
	SALTS_LEN=$SALTS_SIZE
	echo "[$GREEN OK $NC] SALTS_SIZE"
fi

AUTH_KEY=$(openssl rand -base64 $SALTS_LEN)
SECURE_AUTH_KEY=$(openssl rand -base64 $SALTS_LEN)
LOGGED_IN_KEY=$(openssl rand -base64 $SALTS_LEN)
NONCE_KEY=$(openssl rand -base64 $SALTS_LEN)
AUTH_SALT=$(openssl rand -base64 $SALTS_LEN)
SECURE_AUTH_SALT=$(openssl rand -base64 $SALTS_LEN)
LOGGED_IN_SALT=$(openssl rand -base64 $SALTS_LEN)
NONCE_SALT=$(openssl rand -base64 $SALTS_LEN)

if [ "$ENV_CHECK" = "true" ]
then
	echo $GREEN"Config generated. (Here: $PWD/wp-config.php)"
	echo "<?php
/*************************************************
 * FILE GENERATED By                             *
 * https://github.com/romslf/wp-config-generator *
 *************************************************/

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$DB_NAME' );

/** MySQL database username */
define( 'DB_USER', '$DB_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', '$DB_PASS' );

/** MySQL hostname */
define( 'DB_HOST', '$DB_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY', '$AUTH_KEY' );
define( 'SECURE_AUTH_KEY', '$SECURE_AUTH_KEY' );
define( 'LOGGED_IN_KEY', '$LOGGED_IN_KEY' );
define( 'NONCE_KEY', '$NONCE_KEY' );
define( 'AUTH_SALT', '$AUTH_SALT' );
define( 'SECURE_AUTH_SALT', '$SECURE_AUTH_SALT' );
define( 'LOGGED_IN_SALT', '$LOGGED_IN_SALT' );
define( 'NONCE_SALT', '$NONCE_SALT' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
\$table_prefix = '$TAB_PREFIX';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';" > wp-config.php
else
	echo $RED"Please fix below errors before running me again."
fi