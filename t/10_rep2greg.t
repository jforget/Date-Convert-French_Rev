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

sub r2g {
  my $n      = shift;
  my $date_g = shift;
  my $date   = new Date::Convert::French_Rev @_;
  convert Date::Convert::Gregorian $date;
  my $date_resul = $date->date_string;
  if ($date_g eq $date_resul)
    { print "ok $n\n" }
  else
    { print "not ok $n : expected $date_g, got $date_resul\n" }
}

@tests = (["1792 Sep 22",   1,  1,  1], 
          ["1793 Oct 23",   2,  2,  2],
          ["1794 July 27",  2, 11,  9], # the demise of Robespierre
          ["1794 Nov 23",   3,  3,  3],
          ["1795 Oct 5",    4,  1, 13], # Saint-Roch church demonstration
          ["1795 Dec 25",   4,  4,  4],
          ["1797 Jan 24",   5,  5,  5],
          ["1798 Feb 24",   6,  6,  6],
          ["1799 Nov 9",    8,  2, 18], # Bonaparte's coup
          ["1801 Mar 29",   9,  7,  8],
          ["1804 Apr 30",  12,  8, 10],
          ["1807 Jun 1",   15,  9, 12],
          ["1810 July 3",  18, 10, 14],
          ["1813 Aug 4",   21, 11, 16],
          ["1816 Sep 4",   24, 12, 18],
          ["2000 Jan 1",  208,  4, 12], # Y2K compatible? Will your computer freeze or what?
          ["2001 May 11", 209,  8, 22], # So long, Douglas, and thanks for all the fun
          );

printf "1..%d\n", scalar @tests;

foreach (@tests) { r2g $n++, @$_ }
