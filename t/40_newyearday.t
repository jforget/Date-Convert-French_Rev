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


@tests = ([" 1 Vendémiaire I",                     "", 1792,  9, 22],
	  ["Jour des Récompenses I",        "%EJ %EY", 1793,  9, 21],
	  [" 1 Vendémiaire II",                    "", 1793,  9, 22],
	  ["Jour des Récompenses II",       "%EJ %EY", 1794,  9, 21],
	  [" 1 Vendémiaire III",                   "", 1794,  9, 22],
	  ["Jour de la Révolution III",     "%EJ %EY", 1795,  9, 22],
	  [" 1 Vendémiaire IV",                    "", 1795,  9, 23],
	  ["Jour des Récompenses IV",       "%EJ %EY", 1796,  9, 21],
	  [" 1 Vendémiaire V",                     "", 1796,  9, 22],
	  ["Jour des Récompenses V",        "%EJ %EY", 1797,  9, 21],
	  [" 1 Vendémiaire VI",                    "", 1797,  9, 22],
	  ["Jour des Récompenses VI",       "%EJ %EY", 1798,  9, 21],
	  [" 1 Vendémiaire VII",                   "", 1798,  9, 22],
	  ["Jour de la Révolution VII",     "%EJ %EY", 1799,  9, 22],
	  [" 1 Vendémiaire VIII",                  "", 1799,  9, 23],
	  ["Jour des Récompenses VIII",     "%EJ %EY", 1800,  9, 22],
	  [" 1 Vendémiaire IX",                    "", 1800,  9, 23],
	  ["Jour des Récompenses IX",       "%EJ %EY", 1801,  9, 22],
	  [" 1 Vendémiaire X",                     "", 1801,  9, 23],
	  ["Jour des Récompenses X",        "%EJ %EY", 1802,  9, 22],
	  [" 1 Vendémiaire LVI",                   "", 1847,  9, 23],
	  ["Jour de la Révolution LVI",     "%EJ %EY", 1848,  9, 22],
	  [" 1 Vendémiaire LVII",                  "", 1848,  9, 23],
	  ["Jour des Récompenses LVII",     "%EJ %EY", 1849,  9, 22],
	  [" 1 Vendémiaire LVIII",                 "", 1849,  9, 23],
	  ["Jour des Récompenses LVIII",    "%EJ %EY", 1850,  9, 22],
	  [" 1 Vendémiaire C",                     "", 1891,  9, 23],
	  ["Jour des Récompenses C",        "%EJ %EY", 1892,  9, 21],
	  [" 1 Vendémiaire CI",                    "", 1892,  9, 22],
	  ["Jour des Récompenses CI",       "%EJ %EY", 1893,  9, 21],
	  [" 1 Vendémiaire CVIII",                 "", 1899,  9, 22],
	  ["Jour de la Révolution CVIII",   "%EJ %EY", 1900,  9, 22],
	  [" 1 Vendémiaire CC",                    "", 1991,  9, 23],
	  ["Jour des Récompenses CC",       "%EJ %EY", 1992,  9, 21],
	  [" 1 Vendémiaire CCI",                   "", 1992,  9, 22],
	  ["Jour des Récompenses CCI",      "%EJ %EY", 1993,  9, 21],
	  [" 1 Vendémiaire CCVIII",                "", 1999,  9, 22],
	  ["Jour de la Révolution CCVIII",  "%EJ %EY", 2000,  9, 21],
	  [" 1 Vendémiaire CCC",                   "", 2091,  9, 22],
	  ["Jour des Récompenses CCC",      "%EJ %EY", 2092,  9, 20],
	  [" 1 Vendémiaire CCCI",                  "", 2092,  9, 21],
	  ["Jour des Récompenses CCCI",     "%EJ %EY", 2093,  9, 20],
	  [" 1 Vendémiaire CCCVIII",               "", 2099,  9, 21],
	  ["Jour de la Révolution CCCVIII", "%EJ %EY", 2100,  9, 21],
	  [" 1 Vendémiaire CD",                    "", 2191,  9, 22],
	  ["Jour de la Révolution CD",      "%EJ %EY", 2192,  9, 21],
	  [" 1 Vendémiaire CDI",                   "", 2192,  9, 22],
	  ["Jour des Récompenses CDI",      "%EJ %EY", 2193,  9, 21],
	  [" 1 Vendémiaire CDVIII",                "", 2199,  9, 22],
	  ["Jour de la Révolution CDVIII",  "%EJ %EY", 2200,  9, 22],
	  );

printf "1..%d\n", scalar @tests;

foreach (@tests) { g2r $n++, @$_ }
