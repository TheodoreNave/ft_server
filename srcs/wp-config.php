<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'b0:Q@i:LqEeX{4E m$/74|a.e.lGs<ytE$[QSOl9c*i[yRpJuSjC^` nj2;a7A#P' );
define( 'SECURE_AUTH_KEY',  'DL8,X?wBc-AB60WxG-Qn_bk7+buc{SQj-Pk $4O%  YkR4G<rt!?1IdWJ.4[$,wv' );
define( 'LOGGED_IN_KEY',    'dFyb%foJ&h( M:RX>enXhiwg?F4DCYL=[N+e;d5S!TX%`;$^!<LDO$`bIo ^tJJ[' );
define( 'NONCE_KEY',        'sVz TIS6hGvfmH,1C&rWg/(ti&kNwhuxXWH(txJ5*-l+GYaJ~I J?h@W(.n};>6!' );
define( 'AUTH_SALT',        '[ED~F=c&WYl|`RxR#jt,[81|!BV=U>/[]T9R/_u+W6ud~0AeV&B%7+9tKm0yB/b#' );
define( 'SECURE_AUTH_SALT', 'A!@6&B&&(?peFNAu+TN>*2Q]tsk5PHp8JF2n3YhGB[oq%gDn`F)ZPb0Vw;lVJl!5' );
define( 'LOGGED_IN_SALT',   'w6}(k2M4?8cJNaW0NeJ<9-TN!m`8|@5IrqytVRa6PRK|!]A_dJS$c,$&<Q/a7E(I' );
define( 'NONCE_SALT',       '0M/H,)*x=6(4F)+W*)C?W@x52^K#MQHNGFF&TfLW2s=#YE-n;swPr+?KQ[#69ZZ}' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';