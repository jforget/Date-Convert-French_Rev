# -*- encoding: utf-8; indent-tabs-mode: nil -*-
#
#     Test script for Date::Convert::French_Rev
#     Copyright (C) 2001, 2002, 2003, 2013 Jean Forget
#
#     This program is distributed under the same terms as Perl 5.16.3:
#     GNU Public License version 1 or later and Perl Artistic License
#
#     You can find the text of the licenses in the F<LICENSE> file or at
#     L<http://www.perlfoundation.org/artistic_license_1_0>
#     and L<http://www.gnu.org/licenses/gpl-1.0.html>.
#
#     Here is the summary of GPL:
#
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 1, or (at your option)
#     any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software Foundation,
#     Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
#
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

@tests = ([" 1 Vendémiaire I",    "", 1792,  9, 22],
          [" 2 Brumaire II",      "", 1793, 10, 23],
          [" 9 Thermidor II",     "", 1794,  7, 27],
          [" 3 Frimaire III",     "", 1794, 11, 23],
          ["13 Vendémiaire IV",   "", 1795, 10,  5],
          [" 4 Nivôse IV",        "", 1795, 12, 25],
          [" 5 Pluviôse V",       "", 1797,  1, 24],
          [" 6 Ventôse VI",       "", 1798,  2, 24],
          ["18 Brumaire VIII",    "", 1799, 11,  9],
          [" 8 Germinal IX",      "", 1801,  3, 29],
          ["10 Floréal XII",      "", 1804,  4, 30],
          ["12 Prairial XV",      "", 1807,  6,  1],
          ["14 Messidor XVIII",   "", 1810,  7,  3],
          ["16 Thermidor XXI",    "", 1813,  8,  4],
          ["18 Fructidor XXIV",   "", 1816,  9,  4],
          ["12 Nivôse CCVIII",    "", 2000,  1,  1], # Y2K compatible?
          ["22 Floréal CCIX",     "", 2001,  5, 11],
          );

printf "1..%d\n", scalar @tests;

foreach (@tests) { g2r $n++, @$_ }

