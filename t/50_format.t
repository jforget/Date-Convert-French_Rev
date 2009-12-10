use Date::Convert::French_Rev;

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

my @tests = (["Nonidi 09 Thermidor II", "%A %d %B %EY", 1794,  7, 27],
	     ["Oct 18 Bru 0008",  "%a %d %b %Y", 1799, 11,  9],
	     ["0008",                      "%Y", 1799, 11,  9],
	     ["%Y",                       "%%Y", 1799, 11,  9],
	     ["%0008",                   "%%%Y", 1799, 11,  9],
	     ["%%Y",                    "%%%%Y", 1799, 11,  9],
	     ["13 Vnd, potiron",   "%d %b, %Oj", 1797, 10,  4],
	     # Groundhog day? No, jour de l'avelinier
	     ["14 Plu, jour de l'avelinier 0209", "%d %b, %Ej %Y", 2001,  2,  2],
	     ["14 Plu, Jour de l'Avelinier 0209", "%e %h, %EJ %G", 2001,  2,  2],
	     ["14 Pluvi�se, avelinier 0209",      "%e %B, %Oj %L", 2001,  2,  2],
["Qua 14 Germinal CCIX, jour du h�tre", "%a %d %B %EY, %Ej", 2001, 4, 3],
["Primidi 11 Vend�miaire ccix, Jour de la Pomme de terre", "%A %d %B %Ey, %EJ", 2000, 10, 2],
[" 5 jour compl�mentaire 09, Jour des R�compenses", "%e %B %y, %EJ", 2001, 9, 21],
["mois : 02  2, jour 046, jour du chervis", "mois : %m %f, jour %j, %Ej", 2000, 11, 6],
[" 6 (Sextidi), jour de la bagarade", "%w (%A), %Ej", 2001, 9, 12],
	     );

my $nb_tests = @tests;
my $n = 1;

print "1..$nb_tests\n";

foreach (@tests) { g2r $n++, @$_ }
