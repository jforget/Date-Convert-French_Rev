use Date::Convert::French_Rev;

my $n = 1;

sub g2r {
  my $n      = shift;
  my $date_r = shift;
  my $format = shift;
  my $date   = new Date::Convert::Gregorian @_;
  convert Date::Convert::French_Rev $date;
  my $date_resul = $date->date_string($format);
  if ($date_r eq $date_resul)
    { print "ok $n\n" }
  else
    { print "not ok $n : expected $date_r, got $date_resul\n" }
}

@tests = ([" 1 Vend�miaire I",    "", 1792,  9, 22],
	  [" 2 Brumaire II",      "", 1793, 10, 23],
	  [" 9 Thermidor II",     "", 1794,  7, 27],
	  [" 3 Frimaire III",     "", 1794, 11, 23],
	  ["13 Vend�miaire IV",   "", 1795, 10,  5],
	  [" 4 Niv�se IV",        "", 1795, 12, 25],
	  [" 5 Pluvi�se V",       "", 1797,  1, 24],
	  [" 6 Vent�se VI",       "", 1798,  2, 24],
	  ["18 Brumaire VIII",    "", 1799, 11,  9],
	  [" 8 Germinal IX",      "", 1801,  3, 29],
	  ["10 Flor�al XII",      "", 1804,  4, 30],
	  ["12 Prairial XV",      "", 1807,  6,  1],
	  ["14 Messidor XVIII",   "", 1810,  7,  3],
	  ["16 Thermidor XXI",    "", 1813,  8,  4],
	  ["18 Fructidor XXIV",   "", 1816,  9,  4],
	  ["12 Niv�se CCVIII",    "", 2000,  1,  1], # Y2K compatible?
	  ["22 Flor�al CCIX",     "", 2001,  5, 11],
	  );

printf "1..%d\n", scalar @tests;

foreach (@tests) { g2r $n++, @$_ }

