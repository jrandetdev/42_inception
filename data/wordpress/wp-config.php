<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database' );

/** Database username */
define( 'DB_USER', 'wordpress' );

/** Database password */
define( 'DB_PASSWORD', 'Z8HQ4U0KfpyiTLFG3eb541HEC6Yyg3mu' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

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
define( 'AUTH_KEY',          '))u^{ry.*%.J,E!J:jT 5sp_.8+]:iGH8[:WGG|3f>duZQ/!7mink%B?I$$ewk#w' );
define( 'SECURE_AUTH_KEY',   'iwWIf%FJw-|Zzz~}4D=pA4IK{(p:m1U}s5vxADITRfeGDlk:y$1?W4fa~:--bI+2' );
define( 'LOGGED_IN_KEY',     '09RxA|un9x+pjKm+J!q(NU1jdHkdHt)1<m{od/OY~! iKr6RWb3?u[)0[#2+nHL.' );
define( 'NONCE_KEY',         '3q/bfH-R~7JS).UTs8)`!8?^7mhW_m1o]TFw#`)Fp[dqNh$(D)*Ni/RqRC,RpkU@' );
define( 'AUTH_SALT',         'pB;o+knz5L).3eFU&C8d I^YX@@c}U*k+N[&[[<9:qMC8wR):_BdT&CSh~%v}e~o' );
define( 'SECURE_AUTH_SALT',  'o~%06=yA:g;4|f}`${]#J_iImS3-_[)RPQL~ciK$Ui-iCto|Xjjl<.wCy@ZF==bV' );
define( 'LOGGED_IN_SALT',    '0<FDh=i{]K4fFuk/@K1@zm!!nI>2Yq*SmpS!>UZF;jm,:syi!e`gT@Bhl(-iplRF' );
define( 'NONCE_SALT',        '!bce=^(`2x01f*i8nZp(ktu_!#cR)o;kG&h0u=^j<PT uDLs_#7IfRP3f#ba]tBF' );
define( 'WP_CACHE_KEY_SALT', '+QLUNWg!)q.c>Zqi/cd4DzZj>0T=$fVVbK${CKGB!CYP,jR$1`n8Iu1To*Q-6x=9' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
