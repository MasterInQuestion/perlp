	@(
	SETLOCAL
	SET PERLIO=:raw:utf8
	) & (
	"C:\perl\bin\perl.exe" -p ^
	-e "BEGIN { $^H |= 0x02a00000; $^H{reflags_charset} = 4; $/ = undef(); }" ^
	-e "BEGIN { $x0 = ${^RE_DEBUG_FLAGS}; ${^RE_DEBUG_FLAGS} = 0; }; BEGIN { if ( ! defined( $^I ) ) { foreach ( @ARGV ) { s/(*:0)(?=^(?:(?:[A-Z]:|\.{1,2})?[\\\/]|(?:[A-Z]:|NUL|\.{0,2})\s*\z)(*:1))?/ '< '.( $REGMARK eq '1' ? '' : '.\\' ); /ie; $_ .= "^""\x00"^""; }; }; }; BEGIN { ${^RE_DEBUG_FLAGS} = $x0; };" ^
	-e %*
	)
