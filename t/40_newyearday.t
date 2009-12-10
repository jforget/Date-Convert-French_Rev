use Date::Convert::French_Rev;

my $n = 1;

sub g2r {
  my $n      = shift;
  my $date_r = shift;
  my $format = shift;
  my $date = new Date::Convert::Gregorian @_;
  convert Date::Convert::French_Rev $date;
  my $date_resul = $date->date_string($format);
  if ($date_r eq $date_resul)
    { print "ok $n\n" }
  else
    { print "not ok $n : expected $date_r, got $date_resul\n" }
}


@tests = ([" 1 Vend�miaire I",                     "", 1792,  9, 22],
	  ["Jour des R�compenses I",        "%EJ %EY", 1793,  9, 21],
	  [" 1 Vend�miaire II",                    "", 1793,  9, 22],
	  ["Jour des R�compenses II",       "%EJ %EY", 1794,  9, 21],
	  [" 1 Vend�miaire III",                   "", 1794,  9, 22],
	  ["Jour de la R�volution III",     "%EJ %EY", 1795,  9, 22],
	  [" 1 Vend�miaire IV",                    "", 1795,  9, 23],
	  ["Jour des R�compenses IV",       "%EJ %EY", 1796,  9, 21],
	  [" 1 Vend�miaire V",                     "", 1796,  9, 22],
	  ["Jour des R�compenses V",        "%EJ %EY", 1797,  9, 21],
	  [" 1 Vend�miaire VI",                    "", 1797,  9, 22],
	  ["Jour des R�compenses VI",       "%EJ %EY", 1798,  9, 21],
	  [" 1 Vend�miaire VII",                   "", 1798,  9, 22],
	  ["Jour de la R�volution VII",     "%EJ %EY", 1799,  9, 22],
	  [" 1 Vend�miaire VIII",                  "", 1799,  9, 23],
	  ["Jour des R�compenses VIII",     "%EJ %EY", 1800,  9, 22],
	  [" 1 Vend�miaire IX",                    "", 1800,  9, 23],
	  ["Jour des R�compenses IX",       "%EJ %EY", 1801,  9, 22],
	  [" 1 Vend�miaire X",                     "", 1801,  9, 23],
	  ["Jour des R�compenses X",        "%EJ %EY", 1802,  9, 22],
	  [" 1 Vend�miaire LVI",                   "", 1847,  9, 23],
	  ["Jour de la R�volution LVI",     "%EJ %EY", 1848,  9, 22],
	  [" 1 Vend�miaire LVII",                  "", 1848,  9, 23],
	  ["Jour des R�compenses LVII",     "%EJ %EY", 1849,  9, 22],
	  [" 1 Vend�miaire LVIII",                 "", 1849,  9, 23],
	  ["Jour des R�compenses LVIII",    "%EJ %EY", 1850,  9, 22],
	  [" 1 Vend�miaire C",                     "", 1891,  9, 23],
	  ["Jour des R�compenses C",        "%EJ %EY", 1892,  9, 21],
	  [" 1 Vend�miaire CI",                    "", 1892,  9, 22],
	  ["Jour des R�compenses CI",       "%EJ %EY", 1893,  9, 21],
	  [" 1 Vend�miaire CVIII",                 "", 1899,  9, 22],
	  ["Jour de la R�volution CVIII",   "%EJ %EY", 1900,  9, 22],
	  [" 1 Vend�miaire CC",                    "", 1991,  9, 23],
	  ["Jour des R�compenses CC",       "%EJ %EY", 1992,  9, 21],
	  [" 1 Vend�miaire CCI",                   "", 1992,  9, 22],
	  ["Jour des R�compenses CCI",      "%EJ %EY", 1993,  9, 21],
	  [" 1 Vend�miaire CCVIII",                "", 1999,  9, 22],
	  ["Jour de la R�volution CCVIII",  "%EJ %EY", 2000,  9, 21],
	  [" 1 Vend�miaire CCC",                   "", 2091,  9, 22],
	  ["Jour des R�compenses CCC",      "%EJ %EY", 2092,  9, 20],
	  [" 1 Vend�miaire CCCI",                  "", 2092,  9, 21],
	  ["Jour des R�compenses CCCI",     "%EJ %EY", 2093,  9, 20],
	  [" 1 Vend�miaire CCCVIII",               "", 2099,  9, 21],
	  ["Jour de la R�volution CCCVIII", "%EJ %EY", 2100,  9, 21],
	  [" 1 Vend�miaire CD",                    "", 2191,  9, 22],
	  ["Jour de la R�volution CD",      "%EJ %EY", 2192,  9, 21],
	  [" 1 Vend�miaire CDI",                   "", 2192,  9, 22],
	  ["Jour des R�compenses CDI",      "%EJ %EY", 2193,  9, 21],
	  [" 1 Vend�miaire CDVIII",                "", 2199,  9, 22],
	  ["Jour de la R�volution CDVIII",  "%EJ %EY", 2200,  9, 22],
	  );

printf "1..%d\n", scalar @tests;

foreach (@tests) { g2r $n++, @$_ }
