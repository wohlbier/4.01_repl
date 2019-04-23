************************************************
Program Name/Arguments: 
repl_class.mwx 
************************************************
Simulator Version: EMUSIM-19.02
************************************************
Configuration Details:
Gossamer Cores per Nodelet=4
Log2 Nodelets per Node=3
Number of Nodes=1
Total nodelet count=8
Log2 Memory Size per Nodelet=33
Total Memory (in GiB)=64
Capture queue depths=true
Timing sample interval (ns)=10000
Initial thread: Send ACKs from remotes=true
Bandwidth multiplier through MigrEng=1
Core Clock=300 MHz, Pd=3.333
Memory DDR4-2133: Bandwidth = 1.886 GiB/s = 2.025 GB/s
SRIO SystemIC bandwidth=2.32 GiB/s (2.5GB/s)
************************************************
PROGRAM ENDED.
Emu system run time 0.000219 sec==218978100 ps
System thread counts:
	active=0, created=3, died=3,
	max live=3 first occurred @131030229 ps with prog 59.8% complete
	and last occurred @131030229 ps with prog 59.8% complete
Num_Core_Cycles=65700
Num_SRIO_Cycles=136861
Num_Mem_Cycles=55437
************************************************
MEMORY MAP
298,0,1,0,0,1,0,0
0,0,0,0,0,0,0,0
2,0,85,0,0,0,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0
2,0,0,0,0,85,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0

************************************************
REMOTES MAP
0,2,2,2,2,2,2,2
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0

************************************************
Module: #_created, #_spawns, #_quits, #_migrates, #_rmos_in, #_rmos_out, mem_bw, IPC
NLET[0]: 1, 0, 3, 2, 0, 14, 0.00728755, 0.041035
NLET[1]: 0, 0, 0, 0, 2, 0, 3.6077e-05, 0
NLET[2]: 0, 1, 0, 2, 2, 0, 0.00178581, 0.00869102
NLET[3]: 0, 0, 0, 0, 2, 0, 3.6077e-05, 0
NLET[4]: 0, 0, 0, 0, 2, 0, 3.6077e-05, 0
NLET[5]: 0, 1, 0, 2, 2, 0, 0.00178581, 0.00869102
NLET[6]: 0, 0, 0, 0, 2, 0, 3.6077e-05, 0
NLET[7]: 0, 0, 0, 0, 2, 0, 3.6077e-05, 0

Module: #_in_xacts, in_bw, #_to_nqms, #_to_sysic, p_zero, p_one, opt1, opt2, restored
ME[0].FromNQM[0]: 16, 0.00130898, 16, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[1]: 2, 3.04414e-05, 2, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[2]: 4, 0.000669711, 4, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[3]: 2, 3.04414e-05, 2, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[4]: 2, 3.04414e-05, 2, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[5]: 4, 0.000669711, 4, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[6]: 2, 3.04414e-05, 2, 0, 0, 0, 0, 0, 0
ME[0].FromNQM[7]: 2, 3.04414e-05, 2, 0, 0, 0, 0, 0, 0

Module: #_in_xacts, in_bw, out_bw, passers_by, passers_stored
ME[0].FromSysIC[0]: 0, 0, 0, 0, 0
ME[0].FromSysIC[1]: 0, 0, 0, 0, 0
ME[0].FromSysIC[2]: 0, 0, 0, 0, 0
ME[0].FromSysIC[3]: 0, 0, 0, 0, 0
ME[0].FromSysIC[4]: 0, 0, 0, 0, 0
ME[0].FromSysIC[5]: 0, 0, 0, 0, 0

Module: #_out_xacts, out_bw, avg_total_reqs, avg_total_reqs_exZero, avg_rio_reqs, avg_rio_reqs_exZero, avg_nqm_reqs, avg_nqm_reqs_exZero
ME[0].ToNQM[0]: 18, 0.00149163, 0.000274374, 1, 0, -nan, 0.000274374, 1
ME[0].ToNQM[1]: 2, 9.13242e-05, 3.04433e-05, 1, 0, -nan, 3.04433e-05, 1
ME[0].ToNQM[2]: 3, 0.00042618, 4.56802e-05, 1, 0, -nan, 4.56802e-05, 1
ME[0].ToNQM[3]: 2, 9.13242e-05, 3.04433e-05, 1, 0, -nan, 3.04433e-05, 1
ME[0].ToNQM[4]: 2, 9.13242e-05, 3.04433e-05, 1, 0, -nan, 3.04433e-05, 1
ME[0].ToNQM[5]: 3, 0.00042618, 4.56802e-05, 1, 0, -nan, 4.56802e-05, 1
ME[0].ToNQM[6]: 2, 9.13242e-05, 3.04433e-05, 1, 0, -nan, 3.04433e-05, 1
ME[0].ToNQM[7]: 2, 9.13242e-05, 3.04433e-05, 1, 0, -nan, 3.04433e-05, 1

Module: #_out_xacts, out_bw, avg_total_reqs, avg_total_reqs_exZero, avg_rio_reqs, avg_rio_reqs_exZero, avg_nqm_reqs, avg_nqm_reqs_exZero
ME[0].ToSysIC[0]: 0, 0, 0, -nan, 0, -nan, 0, -nan
ME[0].ToSysIC[1]: 0, 0, 0, -nan, 0, -nan, 0, -nan
ME[0].ToSysIC[2]: 0, 0, 0, -nan, 0, -nan, 0, -nan
ME[0].ToSysIC[3]: 0, 0, 0, -nan, 0, -nan, 0, -nan
ME[0].ToSysIC[4]: 0, 0, 0, -nan, 0, -nan, 0, -nan
ME[0].ToSysIC[5]: 0, 0, 0, -nan, 0, -nan, 0, -nan


************************************************
Simulator wall clock time (seconds): 0
