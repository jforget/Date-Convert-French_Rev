use ExtUtils::MakeMaker;

WriteMakefile(
      'NAME'	     => 'Date::Convert::French_Rev'
   ,  'VERSION_FROM' => 'lib/Date/Convert/French_Rev.pm'
   ,  'PREREQ_PM'    => {   Roman => 0
		          , Date::Convert => 0 }
   ,  'ABSTRACT'     => 'Date conversions using the French Revolutionary calendar'
   ,  'AUTHOR'       => 'Jean Forget <JFORGET@cpan.org>'
);
