create_library_set -name max_timing\
   -timing slow.lib

create_library_set -name min_timing\
   -timing fast.lib
create_delay_corner -name max_delay\
   -library_set max_timing


create_delay_corner -name min_delay\
   -library_set min_timing

create_constraint_mode -name sdc_cons\
   -sdc_files\MAC_new.sdc

create_analysis_view -name wc -constraint_mode sdc_cons -delay_corner max_delay
create_analysis_view -name bc -constraint_mode sdc_cons -delay_corner min_delay

set_analysis_view -setup wc -hold bc
