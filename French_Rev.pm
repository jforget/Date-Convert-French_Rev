package Date::Convert::French_Rev;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);
use Date::Convert;
use Carp;
use Roman;

require Exporter;

@ISA = qw(Date::Convert Exporter);
# Do not export methods, therefore export nothing
@EXPORT = qw(
	
);
$VERSION = '0.02';

use constant REV_BEGINNING => 2375840; # 1 Vendémiaire I in the Revolutionary calendar
my @MONTHS_SHORT  = qw ( Vnd Bru Fri Niv Plu Vnt Ger Flo Pra Mes The Fru S-C);
my @ADD_DAYS_SHORT= qw ( Vertu Génie Trav Raison Récomp Révol);
my @MONTHS = qw(Vendémiaire Brumaire  Frimaire
                Nivôse      Pluviôse  Ventôse
	        Germinal    Floréal   Prairial
	        Messidor    Thermidor Fructidor);
push @MONTHS, "jour complémentaire";

# The day numer 10 is counterintuitively placed in the 0-th element
# because the modulus operator and the Perl arrays are 0-based.
# It works. Do not report a bug.
my @DECADE_DAYS = qw ( Décadi Primidi Duodi Tridi Quartidi Quintidi Sextidi Septidi Octidi Nonidi);
my @DECADE_DAYS_SHORT = qw ( Déc Pri Duo Tri Qua Qui Sex Sep Oct Non);

# When initializing an array with lists within lists, it means one of two things:
# Either it is a newbie who does not know how to make multi-dimensional arrays,
# Or it is a (at least mildly) experienced Perl-coder who, for some reason, 
# wants to initialize a flat array with the concatenation of lists.
# I am a (mildly) experienced programmer who wants to use qw() and yet insert
# comments in some places.
my @DAYS = (
# Vendémiaire
	qw(
       0raisin           0safran           1châtaigne        1colchique        0cheval
       1balsamine        1carotte          2amarante         0panais           1cuve
       1pomme_de_terre   2immortelle       0potiron          0réséda           2âne
       1belle_de_nuit    1citrouille       0sarrasin         0tournesol        0pressoir
       0chanvre          1pèche            0navet            2amaryllis        0boeuf
       2aubergine        0piment           1tomate           2orge             0tonneau
	),
# Brumaire
	qw(
       1pomme            0céleri           1poire            1betterave        2oie
       2héliotrope       1figue            1scorsonère       2alisier          1charrue
       0salsifis         1macre            0topinambour      2endive           0dindon
       4chervis          0cresson          1dentelaire       1grenade          1herse
       5bacchante        2azerole          1garance          2orange           0faisan
       1pistache         4macjon           0coing            0cormier          0rouleau
	),
# Frimaire
	qw(
       1raiponce         0turneps          1chicorée         1nèfle            0cochon
       1mâche            0chou-fleur       0miel             0genièvre         1pioche
       1cire             0raifort          0cèdre            0sapin            0chevreuil
       2ajonc            0cyprès           0lierre           1sabine           0hoyau
       2érable-sucre     1bruyère          0roseau           2oseille          0grillon
       0pignon           0liège            1truffe           2olive            1pelle
	),
# Nivôse
	qw(
       1tourbe           1houille          0bitume           0soufre           0chien
       1lave             1terre_végétale   0fumier           0salpêtre         0fléau
       0granit           2argile           2ardoise          0grès             0lapin
       0silex            1marne            1pierre_à_chaux   0marbre           0van
       1pierre_à_plâtre  0sel              0fer              0cuivre           0chat
       2étain            0plomb            0zinc             0mercure          0crible
	),
# Pluviôse
	qw(
       5lauréole         1mousse           0fragon           0perce-neige      0taureau
       0laurier-thym     2amadouvier       4mézéréon         0peuplier         1cognée
       2ellébore         0brocoli          0laurier          2avelinier        1vache
       0buis             0lichen           2if               1pulmonaire       1serpette
       0thlaspi          4thymelé          0chiendent        5trainasse        0lièvre
       1guède            0noisetier        0cyclamen         1chélidoine       0traîneau
	),
# Ventôse
	qw(
       0tussilage        0cornouiller      0violier          0troène           0bouc
       2asaret           2alaterne         1violette         0marsault         1bêche
       0narcisse         2orme             1fumeterre        0vélar            1chèvre
       2épinard          0doronic          0mouron           0cerfeuil         0cordeau
       1mandragore       0persil           0cochléaria       1pâquerette       0thon
       0pissenlit        1sylvie           0capillaire       0frêne            0plantoir
	),
# Germinal
	qw(
       1primevère        0platane          2asperge          1tulipe           1poule
       1blette           0bouleau          1jonquille        2aulne            0couvoir
       1pervenche        0charme           1morille          0hêtre            2abeille
       1laitue           0mélèze           1ciguë            0radis            1ruche
       0gainier          1romaine          0marronnier       1roquette         0pigeon
       0lilas            2anémone          1pensée           1myrtille         0greffoir
	),
# Floréal
	qw(
       1rose             0chêne            1fougère          2aubépine         0rossignol
       2ancolie          0muguet           0champignon       1jacinthe         0rateau
       1rhubarbe         0sainfoin         0bâton-d'or       4chamérisier      0ver_à_soie
       1consoude         1pimprenelle      1corbeille-d'or   2arroche          0sarcloir
       0statice          1fritillaire      1bourrache        1valériane        1carpe
       0fusain           1civette          1buglosse         0sénevé           1houlette
	),
# Prairial
	qw(
       1luzerne          6hémérocalle      0trèfle           2angélique        0canard
       1mélisse          0fromental        0martagon         0serpolet         1faux
       1fraise           1bétoine          0pois             2acacia           1caille
       2oeillet          0sureau           0pavot            0tilleul          1fourche
       0barbeau          1camomille        0chèvrefeuille    0caille-lait      1tanche
       0jasmin           1verveine         0thym             1pivoine          0chariot
	),
# Messidor
	qw(
       0seigle           2avoine           2oignon           1véronique        0mulet
       0romarin          0concombre        2échalotte        2absinthe         1faucille
       0coriandre        2artichaut        1giroflée         1lavande          0chamois
       0tabac            1groseille        1gesse            1cerise           0parc
       1menthe           0cumin            0haricot          2orcanète         1pintade
       1sauge            2ail              1vesce            0blé              5chalémie
	),
# Thermidor
	qw(
       2épautre          0bouillon-blanc   0melon            2ivraie           0bélier
       1prèle            2armoise          0carthame         1mûre             2arrosoir
       4panis            4salicor          2abricot          0basilic          1brebis
       1guimauve         0lin              2amande           1gentiane         2écluse
       1carline          0câprier          1lentille         2aunée            1loutre
       1myrte            0colza            0lupin            0coton            0moulin
	),
# Fructidor
	qw(
       1prune            0millet           0lycoperdon       2escourgeon       0saumon
       1tubéreuse        4sucrion          2apocyn           1réglisse         2échelle
       1pastèque         0fenouil          2épine-vinette    1noix             1truite
       0citron           1cardère          0nerprun          0tagette          1hotte
       2églantier        1noisette         0houblon          0sorgho           2écrevisse
       5bagarade         1verge-d'or       0maïs             0marron           0panier
	),
# Jours complémentaires
	qw(
       1vertu            0génie            0travail          1raison           3récompenses
       1révolution
	 ));

my @PREFIXES = ('jour du ', 'jour de la ', "jour de l'", 'jour des ');

use constant NORMAL_YEAR    => 365;
use constant LEAP_YEAR      => 366;
use constant FOUR_YEARS     => 4 * NORMAL_YEAR + 1; # one leap year every four years
use constant CENTURY        => 25 * FOUR_YEARS - 1; # centuries aren't leap years . . .
use constant FOUR_CENTURIES => 4 * CENTURY + 1;     # . . .except every four centuries.

# number of days between the start of the revolutionary calendar, and the
# beginning of year n - 1
my @YEARS_BEGINS=    (0, 365, 730, 1096, 1461, 1826, 2191, 2557, 2922, 3287, 3652,
		   4018, 4383, 4748, 5113, 5479, 5844);

sub initialize {
    my $self = shift;
    my $year = shift || return Date::Convert::initialize;
    my $month= shift ||
	croak "Date::Convert::French_Rev::initialize needs more args";
    my $day  = shift ||
	croak "Date::Convert::French_Rev::initialize needs more args";
    confess "These routines don't work well for French_Rev before year 1"
	if $year<1;
    my $absol = REV_BEGINNING;
    $$self{'year'} = $year;
    $$self{'month'}= $month;
    $$self{'day'}  = $day;

    my $is_leap = is_leap Date::Convert::French_Rev $year;
    croak "standard day number $day out of range" if $day > 30 and $month <= 12;
    croak "additional day $day out of range" if ($month == 13) and ($day > 5) and !$is_leap;
    croak "additional day $day out of range" if ($month == 13) and ($day > 6) and $is_leap;

    $year --;  #get years *before* this year.  Makes math easier.  :)
    # first, convert year into days. . .
    if ($year >= 16) # Romme rule in effect, or nearly so
      {
	$absol += int($year/400)* FOUR_CENTURIES;
	$year  %= 400;
	$absol += int($year/100)* CENTURY;
	$year  %= 100;
	$absol += int($year/4)* FOUR_YEARS;
	$year  %= 4;
	$absol += $year * NORMAL_YEAR;
      }
    else # table look-up for the programmer-hostile equinox rule
      {	$absol += $YEARS_BEGINS[$year] }

    # now, month into days.
    $absol += 30 * ($month - 1) + $day - 1;

    $$self{absol}=$absol;
}

sub year {
    my $self = shift;
    return $$self{year} if exists $$self{year}; # no point recalculating.
    my $days;
    my $year;
    # note:  years and days are initially days *before* today, rather than
    # today's date.  This is because of fenceposts.  :)
    $days =  $$self{absol} - REV_BEGINNING;
    if ($days < $YEARS_BEGINS[16])
      {
       	$year = scalar grep { $_ <= $days } @YEARS_BEGINS;
	$days -= $YEARS_BEGINS[$year - 1];
	$days++;
      }
    elsif (($days+1) % FOUR_CENTURIES) { # normal case
	$year =  int ($days / FOUR_CENTURIES) * 400;
	$days %= FOUR_CENTURIES;
	$year += int ($days / CENTURY) * 100; # years.
	$days %= CENTURY;
	$year += int ($days / FOUR_YEARS) * 4;
	$days %= FOUR_YEARS;
	if (($days+1) % FOUR_YEARS) {
	    $year += int ($days /  NORMAL_YEAR); # fence post from year 1
	    $days %= NORMAL_YEAR; 
	    $days += 1; # today
	    $year += 1;
	} else {
	    $year += int ($days / NORMAL_YEAR + 1) - 1;
	    $days =  LEAP_YEAR;
	}
    } else { # exact four century boundary.  Uh oh. . .
	$year =  int ($days / FOUR_CENTURIES + 1) * 400;
	$days =  LEAP_YEAR; # correction for later.
    }
    $$self{year}=$year;
    $$self{days_into_year}=$days;
    return $year;
}

sub month {
    my $self = shift;
    return $$self{month} if exists $$self{month};
    my $year = $self -> year;
    my $days = $$self{days_into_year} - 1;
    my $day  = $days % 30;
    $days   -= $day;
    my $month = $days / 30 + 1;
    $$self{month} = $month;
    $$self{day}   = $day + 1;
    return $month;
}



sub day {
    my $self = shift;
    return $$self{day} if exists $$self{day};
    $self->month; # calculates day as a side-effect
    return $$self{day};
}



sub date {
    my $self = shift;
    return ($self->year, $self->month, $self->day);
}

sub is_leap {
    my $self = shift;
    my $year = shift || $self->year; # so is_leap can be static or method

    # Autumn equinox from I to XIX
    return 1 if ($year == 3) or ($year == 7) or ($year == 11) or ($year == 15);
    return 0 if ($year < 20);

    # Romme rule from XX on
    return 0 if (($year %4) || (($year % 400) && !($year % 100)));
    return 1;
}

sub field {
  my ($self, $spec) = @_;
  $spec eq '%d'		&& do { return sprintf "%02d", $self->day };
  $spec eq '%j'		&& do { return sprintf "%03d", 30 * $self->month + $self->day - 30 };
  $spec eq '%e'		&& do { return sprintf "%2d",  $self->day };
  $spec eq '%m'		&& do { return sprintf "%02d", $self->month };
  $spec eq '%f'		&& do { return sprintf "%2d",  $self->month };
  $spec =~ /\%[YGL]/	&& do { return sprintf "%04d", $self->year };
  $spec =~ /\%B/	&& do { return $MONTHS[$self->month - 1] };
  $spec =~ /\%[bh]/	&& do { return $MONTHS_SHORT[$self->month - 1] };
  $spec eq '%y'		&& do { return sprintf "%02d", $self->year % 100 };
  $spec eq '%n'		&& do { return "\n" };
  $spec eq '%t'		&& do { return "\t" };
  $spec eq '%+'		&& do { return '+' };
  $spec eq '%%'		&& do { return '%' };
  if ($self->month < 13)
    {
      my $decade_day = $self->day % 10;
      $spec eq '%a' && do { return $DECADE_DAYS_SHORT[$decade_day] };
      $spec eq '%A' && do { return $DECADE_DAYS[$decade_day] };
      $decade_day ||= 10;
      $spec eq '%w' && do { return sprintf("%2d", $decade_day) };
    }
  else
    {
      $spec eq '%a' && do { return '   ' };
      $spec eq '%A' && do { return '' };
      $spec eq '%w' && do { return '  ' };
    }
  $spec eq '%EY'  && do { return Roman $self->year };
  $spec eq '%Ey'  && do { return roman $self->year };
  $spec eq '%Ej'  && do
    {
      my $jj = 30 * $self->month + $self->day - 31; # %j is 1..366, but $jj is 0..365
      my $lb = $DAYS[$jj];
      $lb =~ s/_/ /g;
      $lb =~ s/^(\d)/$PREFIXES[$1 % 4]/;
      return $lb;
    };
  $spec eq '%EJ'  && do
    {
      my $jj = 30 * $self->month + $self->day - 31; # %j is 1..366, but $jj is 0..365
      my $lb = $DAYS[$jj];
      $lb =~ s/_/ /g;
      # Using a capitalized prefix, and capitalizing the first letter
      $lb =~ s/^(\d)(.)/\u$PREFIXES[$1 % 4]\u$2/;
      return $lb;
    };
  $spec eq '%Oj'  && do
    {
      my $jj = 30 * $self->month + $self->day - 31; # %j is 1..366, but $jj is 0..365
      my $lb = substr $DAYS[$jj], 1;
      $lb =~ s/_/ /g;
      return $lb;
    };
  return $spec;
}

sub date_string {
  my ($self, $format) = @_;

  # Default value when not provided. I do not test true / false, because
  # some pervert could think that "0" is a valid format, even if false.
  $format = "%e %B %EY" if (! defined $format or $format eq '');

  my $year = roman($self->year); # possibly to trigger the side effect
  my $month = $self->month;
  $_ = $format;
  s/(          # start of $1
    \%         # percent sign
    (?:        # start of alternative
     (?:O.)    # extended field specifier: O with a second char
    |          # or
     (?:E.)    # other extended field specifier: E with a second char
    |          # or
     .         # basic field specifier: single char
    ))         # end of alternative and end of $1
      /'$self->field($1)'/eegx; # is there a simpler way to do it?

  return $_;
  $_;
}

# A module must return a true value. Traditionally, a module returns 1.
# But this module is a revolutionary one, so it discards all old traditions.
"Liberté, égalité, fraternité
ou la mort !";

__END__

=head1 NAME

Date::Convert::French_Rev - Convert from / to French Revolutionary Calendar

=head1 SYNOPSIS

  use Date::Convert::French_Rev;

Converting from Gregorian (or other) to Revolutionary

    $date=new Date::Convert::Gregorian(1799, 11, 9);
    convert Date::Convert::French_Rev $date;
    print $date->date_string, "\n";
    print $date->date_string($format), "\n";

Converting from Revolutionary to Gregorian (or other)

    $date=new Date::Convert::French_Rev(8, 2, 18);
    convert Date::Convert::Gregorian $date;
    print $date->date_string, "\n";

=head1 REQUIRES

Date::Convert, Roman

=head1 EXPORTS

Nothing.

=head1 DESCRIPTION

The following methods are available:

=over 4

=item new

Create a new Revolutinary date object with the specified start
parameters, ie. C<$date = new Date::Convert::French_Rev(8, 2, 18)> for
18 Brumaire VIII.

=item date

Extract a list consisting of the year, the month and the day. The end-of-year 
additional days are assigned to the virtual 13th month.

=item year

Return just the year element of date.

=item month

Return the month element of date, or 13 if the date is an additional day at the
end of the year.

=item day

Just like year and month.

=item is_leap

Boolean.

=item convert

Change the date to a new format.

=item date_string

Return the date in a pretty format. You can give an string parameter to adjust
the date format to your preferences.

=back

The format parameter to C<date_string> is a string consisting of any
characters (letters, digits, whitespace, other) with %-prefixed field
descriptors, inspired from the Unix standard C<date(1)> command.

The following field descriptors are recognized:

=over 4

=item %y

year - 00 to 99

=item %Y, %G, %L

year - 0001 to 9999. There is no difference between these three variants. This is
because in the Revolutionary calendar, the beginning of a year is always aligned
with the beginning of a dE<eacute>cade, while in the Gregorian calendar, the beginning
of a year is usually not aligned with the beginning of a week.

=item %EY, %Ey

year as a Roman number - I to MMM

=item %m

month of year - 01 to 12, or 13 for the end-of-year additional days.

=item %f

month of year - " 1" to "12", or "13" for the end-of-year additional days.

=item %b, %h

month abbreviation - Ven to Fru, or S-C for the end-of-year additional days
(called I<Sans-Culottides>).

=item %B

month full name - VendE<eacute>miaire to Fructidor, or "jour complE<eacute>mentaire"
for the end-of-year additional days.

=item %d

day of month - 01 to 30

=item %e

day of month - " 1" to "30"

=item %A

day of dE<eacute>cade - "Primidi" to "DE<eacute>cadi". This value is irrelevant 
for additional days, therefore the field descriptor is replaced by the empty string.

=item %a

abbreviated day of dE<eacute>cade - "Pri" to "DE<eacute>c".
This value is irrelevant for additional days, therefore the field
descriptor is replaced by a blank string. Beware: do not confuse
Sep, Oct and DE<eacute>c with Gregorian calendar months

=item %w

day of dE<eacute>cade - " 1" to "10" (" 1" for Primidi, " 2" for Duodi, etc)
This value is irrelevant for additional days, therefore the field
descriptor is replaced by a blank string.

=item %j

day of the year - "001" to "366".

=item %Ej

full name of the day of the year. Instead of assigning a saint to each
day, the creators of the calendar decided to assign a plant, an animal
or a tool.

=item %EJ

same as %Ej, but significant words are capitalized.

=item %Oj

simple name of the day of the year. Same as %Ej, without the prefix.

=item %n, %t, %%, %+

replaced by a newline, tab, percent and plus character respectively

=back

The time-related field specifiers are irrelevant. Therefore, they are
copied "as is" into the result string. These fields are:

  %h, %k, %i, %I, %p, %M, %S, %s, %o, %Z, %z

Neither are the composite field specifiers supported:

  %c, %C, %u, %g, %D, %x, %l, %r, %R, %T, %X, %V, %Q, %q, %P, %F, %J, %K

=head1 KNOWN BUGS AND CAVEATS

Not many bugs, but many caveats.

Some day names correspond to little known plants. Therefore, I am not
sure if they use the masculine gender or the feminine gender. I have found
some in various dictionaries, but there still remain a few of them.
Note: they are tagged with a 4, 5 or 6 code.

My sources disagree about the 4th additional day. One says "jour de l'opinion",
the other says "jour de la raison".

Another disagreement is that some sources ignore the Romme rule, and
use only the equinox rule. So, a 1- or 2-day difference can happen.

This module inherits its user interface from Mordechai Abzug's
C<Date::Convert>, which is, according to its author, "in pre-alpha
state". Therefore, my module's user interface is also subject to changes.

I have check the manpage for C<date(1)> in two flavors of Unix: Linux
and AIX. In the best case, the extended field descriptors C<%Ex> and
C<%Oy> are poorly documented, but usually they are not documented.

=head1 HISTORICAL NOTES

The Revolutionary calendar was
in use in France from 24 November 1793 (4 Frimaire II) to 31 December
1805 (10 NivE<ocirc>se XIV). An attempt to use the decimal rule (the basis
of the metric system) to the calendar. Therefore, the week disappeared,
replaced by the dE<eacute>cade (10 days, totally different from the English
word "decade", 10 years). In addition, all months have exactly 3
decades, no more, no less.

At first, the year was beginning on the equinox of autumn, for two
reasons. First, the republic had been established on 22 September 1792,
which happened to be the equinox, and second, the equinox was the symbol of
equality, the day and the night lasting exactly 12 hours each. It was
therefore in tune with the republic's motto "Liberty, Equality,
Fraternity". But it was not practical, so Romme proposed a leap year
rule similar to the Gregorian calendar rule.

In his book I<The French Revolution>, the 19th century writer Thomas
Carlyle proposes these translations for the month names:

=over 4

=item VendE<eacute>miaire -> Vintagearious

=item Brumaire -> Fogarious

=item Frimaire -> Frostarious

=item NivE<ocirc>se -> Snowous

=item PluviE<ocirc>se -> Rainous

=item VentE<ocirc>se -> Windous

=item Germinal -> Buddal

=item FlorE<eacute>al -> Floweral

=item Prairial -> Meadowal

=item Messidor -> Reapidor

=item Thermidor -> Heatidor

=item Fructidor -> Fruitidor

=back

=head1 AUTHOR

Jean Forget <J-FORGET@wanadoo.fr>

based on Mordechai T. Abzug's work <morty@umbc.edu>

=head1 SEE ALSO

=head2 Software

date(1), perl(1), Date::DateCalc(3), Date::Convert(3)

calendar/cal-french.el in emacs-20.6 or xemacs 21.1.8

=head2 books

Quid 2001, M and D Frémy, publ. Robert Laffont

Agenda Républicain 197 (1988/89), publ. Syros Alternatives

Any French schoolbook about the French Revolution

The French Revolution, Thomas Carlyle, Oxford University Press

=head2 Internet

http://www.faqs.org/faqs/calendars/faq/part3/

=head1 LICENSE STUFF

Copyright (c) 2001 Jean Forget. All rights reserved. This program is
free software.  You can distribute, modify, and otherwise mangle
Date::Convert::French_Rev under the same terms as perl.

=cut
