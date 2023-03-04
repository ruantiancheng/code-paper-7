function write_func(str,PP,SS,RR)

csvwrite([str,'P.csv'],PP)
csvwrite([str,'S.csv'],SS)
csvwrite([str,'R.csv'],RR)


