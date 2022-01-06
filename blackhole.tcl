
 set val(chan)         Channel/WirelessChannel  ;# channel type
 set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
 set val(ant)          Antenna/OmniAntenna      ;# Antenna type
 set val(ll)           LL                       ;# Link layer type
 set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
 set val(ifqlen)       50                       ;# max packet in ifq
 set val(netif)        Phy/WirelessPhy          ;# network interface type
 set val(mac)          Mac/802_11               ;# MAC type
 set val(nn)           15                     ;# number of mobilenodes
 set val(rp)	       AODV                     ;# routing protocol
 set val(x)            800
 set val(y)            800
set val(stop)            150


set ns              [new Simulator]

set tracefd       [open wireless1.tr w]
set windowVsTime2 [open win.tr w]
set namtrace      [open blackhole.nam w]   

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

set f0 [open throughput.tr w]
set f1 [open delay.tr w]
set f2 [open packetloss.tr w]
# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

# configure the nodes
        $ns node-config -adhocRouting $val(rp) \
                   -llType $val(ll) \
                   -macType $val(mac) \
                   -ifqType $val(ifq) \
                   -ifqLen $val(ifqlen) \
                   -antType $val(ant) \
                   -propType $val(prop) \
                   -phyType $val(netif) \
                   -channelType $val(chan) \
                   -topoInstance $topo \
                   -agentTrace ON \
                   -routerTrace ON \
                   -macTrace OFF \
                   -movementTrace ON
                   
      for {set i 0} {$i < $val(nn) } { incr i } {
            set node_($i) [$ns node]     
      }
proc finish {} {
	global ns f f0 f1  namtrace
	$ns flush-trace
        close $namtrace   
	close $f0
        close $f1              
       	exit 0
}

     

proc record {} {
  global sink37 sink38 sink39 sink23 sink40 sink5 sink6 sink7 f0 f1 f2 
   set ns [Simulator instance]
   set time 0.05
   set bw0 [$sink23 set npkts_]
   set bw1 [$sink40 set npkts_]
   set bw2 [$sink40 set npkts_]
   set now [$ns now]
   puts $f0 "$now [expr $bw1*2]"
   puts $f1 "$now [expr $bw1]"
   puts $f1 "$now [expr $bw1*4]"
   $ns at [expr $now+$time] "record"
  } 

$ns color 0 darkgreen
$ns color 1 blue
$ns color 2 green
$ns color 3 red
$ns color 4 brown
$ns color 5 purple
$ns color 6 gray
$ns color 7 deepskyblue

# Provide initial location of mobilenodes
$node_(0) set X_ -19.0
$node_(0) set Y_ 383.0
$node_(0) set Z_ 0.0

$node_(1) set X_ 537.0
$node_(1) set Y_ 236.0
$node_(1) set Z_ 0.0

$node_(2) set X_ 587.0
$node_(2) set Y_ 540.0
$node_(2) set Z_ 0.0

$node_(3) set X_ 589.0
$node_(3) set Y_ 391.0
$node_(3) set Z_ 0.0

$node_(4) set X_ 405.0
$node_(4) set Y_ 538.0
$node_(4) set Z_ 0.0

$node_(5) set X_ 57.0
$node_(5) set Y_ 222.0
$node_(5) set Z_ 0.0

$node_(6) set X_ 254.0
$node_(6) set Y_ 528.0
$node_(6) set Z_ 0.0

$node_(7) set X_ 432.0
$node_(7) set Y_ 373.0
$node_(7) set Z_ 0.0

$node_(8) set X_ 378.0
$node_(8) set Y_ 204.0
$node_(8) set Z_ 0.0

$node_(9) set X_ 285.0
$node_(9) set Y_ 346.0
$node_(9) set Z_ 0.0

$node_(10) set X_ 55.0
$node_(10) set Y_ 540.0
$node_(10) set Z_ 0.0

$node_(11) set X_ 293.0
$node_(11) set Y_ 658.0
$node_(11) set Z_ 0.0

$node_(12) set X_ 479.0
$node_(12) set Y_ 671.0
$node_(12) set Z_ 0.0

$node_(13) set X_ 182.0
$node_(13) set Y_ 172.0
$node_(13) set Z_ 0.0

$node_(14) set X_ 153.0
$node_(14) set Y_ 386.0
$node_(14) set Z_ 0.0
# Generation of movements
#################################################################################################################################
$ns at 0.0 "$node_(1) setdest 537.0 249.0 25.0"
$ns at 0.0 "$node_(2) setdest 588.0 561.0 25.0"
$ns at 0.0 "$node_(3) setdest 590.0 409.0 25.0"
$ns at 0.0 "$node_(4) setdest 405.0 538.0 25.0"
$ns at 0.0 "$node_(5) setdest 81.0 241.0 25.0"
$ns at 0.0 "$node_(6) setdest 267.0 544.0 25.0"
$ns at 0.0 "$node_(7) setdest 433.0 391.0 25.0"
$ns at 0.0 "$node_(8) setdest 381.0 222.0 25.0"
$ns at 0.0 "$node_(9) setdest 285.0 346.0 25.0"
$ns at 0.0 "$node_(10) setdest 61.0 576.0 25.0"
$ns at 0.0 "$node_(11) setdest 214.0 621.0 25.0"
$ns at 0.0 "$node_(12) setdest 495.0 687.0 25.0"
$ns at 0.0 "$node_(13) setdest 195.0 200.0 25.0"
$ns at 0.0 "$node_(14) setdest 141.0 377.0 25.0"

$ns at 1.0 "$node_(1) setdest 537.0 236.0 25.0"
$ns at 1.0 "$node_(2) setdest 587.0 540.0 25.0"
$ns at 1.0 "$node_(3) setdest 589.0 391.0 25.0"
$ns at 1.0 "$node_(4) setdest 405.0 545.0 25.0"
$ns at 1.0 "$node_(5) setdest 57.0 222.0 25.0"
$ns at 1.0 "$node_(6) setdest 253.0 528.0 25.0"
$ns at 1.0 "$node_(7) setdest 432.0 373.0 25.0"
$ns at 1.0 "$node_(8) setdest 378.0 202.0 25.0"
$ns at 1.0 "$node_(9) setdest 270.0 340.0 25.0"
$ns at 1.0 "$node_(10) setdest 55.0 540.0 25.0"
$ns at 1.0 "$node_(11) setdest 218.0 651.0 25.0"
$ns at 1.0 "$node_(12) setdest 479.0 671.0 25.0"
$ns at 1.0 "$node_(13) setdest 182.0 172.0 25.0"
$ns at 1.0 "$node_(14) setdest 123.0 364.0 25.0"

#########

$ns at 2.0 "$node_(1) setdest 537.0 249.0 25.0"
$ns at 2.0 "$node_(2) setdest 588.0 561.0 25.0"
$ns at 2.0 "$node_(3) setdest 590.0 409.0 25.0"
$ns at 2.0 "$node_(4) setdest 405.0 538.0 25.0"
$ns at 2.0 "$node_(5) setdest 81.0 241.0 25.0"
$ns at 2.0 "$node_(6) setdest 267.0 544.0 25.0"
$ns at 2.0 "$node_(7) setdest 433.0 391.0 25.0"
$ns at 2.0 "$node_(8) setdest 381.0 222.0 25.0"
$ns at 2.0 "$node_(9) setdest 285.0 346.0 25.0"
$ns at 2.0 "$node_(10) setdest 61.0 576.0 25.0"
$ns at 2.0 "$node_(11) setdest 214.0 621.0 25.0"
$ns at 2.0 "$node_(12) setdest 495.0 687.0 25.0"
$ns at 2.0 "$node_(13) setdest 195.0 200.0 25.0"
$ns at 2.0 "$node_(14) setdest 141.0 377.0 25.0"

$ns at 3.0 "$node_(1) setdest 537.0 236.0 25.0"
$ns at 3.0 "$node_(2) setdest 587.0 540.0 25.0"
$ns at 3.0 "$node_(3) setdest 589.0 391.0 25.0"
$ns at 3.0 "$node_(4) setdest 405.0 545.0 25.0"
$ns at 3.0 "$node_(5) setdest 57.0 222.0 25.0"
$ns at 3.0 "$node_(6) setdest 253.0 528.0 25.0"
$ns at 3.0 "$node_(7) setdest 432.0 373.0 25.0"
$ns at 3.0 "$node_(8) setdest 378.0 202.0 25.0"
$ns at 3.0 "$node_(9) setdest 270.0 340.0 25.0"
$ns at 3.0 "$node_(10) setdest 55.0 540.0 25.0"
$ns at 3.0 "$node_(11) setdest 218.0 651.0 25.0"
$ns at 3.0 "$node_(12) setdest 479.0 671.0 25.0"
$ns at 3.0 "$node_(13) setdest 182.0 172.0 25.0"
$ns at 3.0 "$node_(14) setdest 123.0 364.0 25.0"
#############

$ns at 4.0 "$node_(1) setdest 537.0 249.0 25.0"
$ns at 4.0 "$node_(2) setdest 588.0 561.0 25.0"
$ns at 4.0 "$node_(3) setdest 590.0 409.0 25.0"
$ns at 4.0 "$node_(4) setdest 405.0 538.0 25.0"
$ns at 4.0 "$node_(5) setdest 81.0 241.0 25.0"
$ns at 4.0 "$node_(6) setdest 267.0 544.0 25.0"
$ns at 4.0 "$node_(7) setdest 433.0 391.0 25.0"
$ns at 4.0 "$node_(8) setdest 381.0 222.0 25.0"
$ns at 4.0 "$node_(9) setdest 285.0 346.0 25.0"
$ns at 4.0 "$node_(10) setdest 61.0 576.0 25.0"
$ns at 4.0 "$node_(11) setdest 214.0 621.0 25.0"
$ns at 4.0 "$node_(12) setdest 495.0 687.0 25.0"
$ns at 4.0 "$node_(13) setdest 195.0 200.0 25.0"
$ns at 4.0 "$node_(14) setdest 141.0 377.0 25.0"

$ns at 5.0 "$node_(1) setdest 537.0 236.0 25.0"
$ns at 5.0 "$node_(2) setdest 587.0 540.0 25.0"
$ns at 5.0 "$node_(3) setdest 589.0 391.0 25.0"
$ns at 5.0 "$node_(4) setdest 405.0 545.0 25.0"
$ns at 5.0 "$node_(5) setdest 57.0 222.0 25.0"
$ns at 5.0 "$node_(6) setdest 253.0 528.0 25.0"
$ns at 5.0 "$node_(7) setdest 432.0 373.0 25.0"
$ns at 5.0 "$node_(8) setdest 378.0 202.0 25.0"
$ns at 5.0 "$node_(9) setdest 270.0 340.0 25.0"
$ns at 5.0 "$node_(10) setdest 55.0 540.0 25.0"
$ns at 5.0 "$node_(11) setdest 218.0 651.0 25.0"
$ns at 5.0 "$node_(12) setdest 479.0 671.0 25.0"
$ns at 5.0 "$node_(13) setdest 182.0 172.0 25.0"
$ns at 5.0 "$node_(14) setdest 123.0 364.0 25.0"
###################

$ns at 6.0 "$node_(1) setdest 537.0 249.0 25.0"
$ns at 6.0 "$node_(2) setdest 588.0 561.0 25.0"
$ns at 6.0 "$node_(3) setdest 590.0 409.0 25.0"
$ns at 6.0 "$node_(4) setdest 405.0 538.0 25.0"
$ns at 6.0 "$node_(5) setdest 81.0 241.0 25.0"
$ns at 6.0 "$node_(6) setdest 267.0 544.0 25.0"
$ns at 6.0 "$node_(7) setdest 433.0 391.0 25.0"
$ns at 6.0 "$node_(8) setdest 381.0 222.0 25.0"
$ns at 6.0 "$node_(9) setdest 285.0 346.0 25.0"
$ns at 6.0 "$node_(10) setdest 61.0 576.0 25.0"
$ns at 6.0 "$node_(11) setdest 214.0 621.0 25.0"
$ns at 6.0 "$node_(12) setdest 495.0 687.0 25.0"
$ns at 6.0 "$node_(13) setdest 195.0 200.0 25.0"
$ns at 6.0 "$node_(14) setdest 141.0 377.0 25.0"

$ns at 7.0 "$node_(1) setdest 537.0 236.0 25.0"
$ns at 7.0 "$node_(2) setdest 587.0 540.0 25.0"
$ns at 7.0 "$node_(3) setdest 589.0 391.0 25.0"
$ns at 7.0 "$node_(4) setdest 405.0 545.0 25.0"
$ns at 7.0 "$node_(5) setdest 57.0 222.0 25.0"
$ns at 7.0 "$node_(6) setdest 253.0 528.0 25.0"
$ns at 7.0 "$node_(7) setdest 432.0 373.0 25.0"
$ns at 7.0 "$node_(8) setdest 378.0 202.0 25.0"
$ns at 7.0 "$node_(9) setdest 270.0 340.0 25.0"
$ns at 7.0 "$node_(10) setdest 55.0 540.0 25.0"
$ns at 7.0 "$node_(11) setdest 218.0 651.0 25.0"
$ns at 7.0 "$node_(12) setdest 479.0 671.0 25.0"
$ns at 7.0 "$node_(13) setdest 182.0 172.0 25.0"
$ns at 7.0 "$node_(14) setdest 123.0 364.0 25.0"
#########

$ns at 8.0 "$node_(1) setdest 537.0 249.0 25.0"
$ns at 8.0 "$node_(2) setdest 588.0 561.0 25.0"
$ns at 8.0 "$node_(3) setdest 590.0 409.0 25.0"
$ns at 8.0 "$node_(4) setdest 405.0 538.0 25.0"
$ns at 8.0 "$node_(5) setdest 81.0 241.0 25.0"
$ns at 8.0 "$node_(6) setdest 267.0 544.0 25.0"
$ns at 8.0 "$node_(7) setdest 433.0 391.0 25.0"
$ns at 8.0 "$node_(8) setdest 381.0 222.0 25.0"
$ns at 8.0 "$node_(9) setdest 285.0 346.0 25.0"
$ns at 8.0 "$node_(10) setdest 61.0 576.0 25.0"
$ns at 8.0 "$node_(11) setdest 214.0 621.0 25.0"
$ns at 8.0 "$node_(12) setdest 495.0 687.0 25.0"
$ns at 8.0 "$node_(13) setdest 195.0 200.0 25.0"
$ns at 8.0 "$node_(14) setdest 141.0 377.0 25.0"

$ns at 9.0 "$node_(1) setdest 537.0 236.0 25.0"
$ns at 9.0 "$node_(2) setdest 587.0 540.0 25.0"
$ns at 9.0 "$node_(3) setdest 589.0 391.0 25.0"
$ns at 9.0 "$node_(4) setdest 405.0 545.0 25.0"
$ns at 9.0 "$node_(5) setdest 57.0 222.0 25.0"
$ns at 9.0 "$node_(6) setdest 253.0 528.0 25.0"
$ns at 9.0 "$node_(7) setdest 432.0 373.0 25.0"
$ns at 9.0 "$node_(8) setdest 378.0 202.0 25.0"
$ns at 9.0 "$node_(9) setdest 270.0 340.0 25.0"
$ns at 9.0 "$node_(10) setdest 55.0 540.0 25.0"
$ns at 9.0 "$node_(11) setdest 218.0 651.0 25.0"
$ns at 9.0 "$node_(12) setdest 479.0 671.0 25.0"
$ns at 9.0 "$node_(13) setdest 182.0 172.0 25.0"
$ns at 9.0 "$node_(14) setdest 123.0 364.0 25.0"



$ns at 0.0 "$node_(0) label SOURCE"
$ns at 0.0 "$node_(7) label DESTINATION"

$node_(0) color deepskyblue
$ns at 0.0 "$node_(0) color deepskyblue"

$node_(7) color deepskyblue
$ns at 0.0 "$node_(7) color deepskyblue"

$ns at 0.0 "$node_(0) add-mark . blue circle"
$ns at 0.0 "$node_(7) add-mark . blue circle"

$ns at 0.5 "$node_(0) label RREQ"
$ns at 0.7 "$node_(0) label SOURCE"

$ns at 0.7 "$node_(10) label RREQ"
$ns at 0.9 "$node_(10) label ."

$ns at 0.7 "$node_(5) label RREQ"
$ns at 0.9 "$node_(5) label ."

$ns at 0.9 "$node_(14) label RREQ"
$ns at 1.1 "$node_(14) label ."

$ns at 1.1 "$node_(6) label RREQ"
$ns at 1.3 "$node_(6) label ."

$ns at 1.3 "$node_(9) label RREQ"
$ns at 1.5 "$node_(9) label ."

$ns at 1.5 "$node_(4) label RREQ"
$ns at 1.7 "$node_(4) label ."

$ns at 1.8 "$node_(7) label RREP"
$ns at 2.0 "$node_(7) label DESTINATION"

$ns at 2.0 "$node_(6) label RREP"
$ns at 2.2 "$node_(6) label ."

$ns at 2.0 "$node_(9) label RREP"
$ns at 2.2 "$node_(9) label ."

$ns at 2.2 "$node_(10) label RREP"
$ns at 2.4 "$node_(10) label ."

$ns at 2.2 "$node_(14) label RREP"
$ns at 2.4 "$node_(14) label ."

$node_(11) color red
$ns at 2.4 "$node_(11) color red"

$ns at 2.4 "$node_(11) label FAKE-RREP"
$ns at 2.6 "$node_(11) label BLACK-HOLE-NODE"

$node_(5) color red
$ns at 2.4 "$node_(5) color red"

$ns at 2.4 "$node_(5) label FAKE-RREP"
$ns at 2.6 "$node_(5) label BLACK-HOLE-NODE"

$ns at 2.4 "$node_(10) label FAKE-RREP"
$ns at 2.6 "$node_(10) label ."

$ns at 0.0 "$ns trace-annotate \"Network Deployed\""
$ns at 0.1 "$ns trace-annotate \"NODE0 became SOURCE NODE \""
$ns at 0.2 "$ns trace-annotate \"NODE7 became DESTINATION NODE \""
$ns at 0.7 "$ns trace-annotate \"NODE0 flood RREQ packets \""
$ns at 1.8 "$ns trace-annotate \"NODE7 flood RREP packets \""
$ns at 2.4 "$ns trace-annotate \" NODE11 and NODE5 became BLACKHOLE-NODEs and flood FAKE-RREP packets\""
$ns at 3.0 "$ns trace-annotate \" NODE0 send data to BLACKHOLE-NODE\""
###################################################################################################################################
# Set a TCP connection between node_(0) and node_(1)
set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 0.7 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 0.7 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.7 "$ftp start"
$ns at 0.9 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.7 "$ftp start"
$ns at 0.9 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.9 "$ftp start"
$ns at 1.1 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.9 "$ftp start"
$ns at 1.1 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp
$ns attach-agent $node_(11) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.1 "$ftp start"
$ns at 1.3 "$ftp stop"


set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp
$ns attach-agent $node_(4) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.3 "$ftp start"
$ns at 1.5 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.3 "$ftp start"
$ns at 1.5 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.3 "$ftp start"
$ns at 1.5 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp
$ns attach-agent $node_(12) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.5 "$ftp start"
$ns at 1.7 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.5 "$ftp start"
$ns at 1.7 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.8 "$ftp start"
$ns at 2.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.8 "$ftp start"
$ns at 2.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.0 "$ftp start"
$ns at 2.2 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.0 "$ftp start"
$ns at 2.2 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.2 "$ftp start"
$ns at 2.4 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.2 "$ftp start"
$ns at 2.4 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(11) $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.4 "$ftp start"
$ns at 2.6 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.4 "$ftp start"
$ns at 2.6 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.6 "$ftp start"
$ns at 2.8 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 3.0 "$ftp start"

#########################################################################################################################
# Printing the window size

proc plotWindow {tcpSource file} {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
$ns at 10.0 "plotWindow $tcp $f1"  

proc plotWindow1 {tcpSource file} {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now .1$cwnd"
$ns at [expr $now+$time+$time] "plotWindow1 $tcpSource $file" }
$ns at 10.0 "plotWindow1 $tcp $f0" 

proc plotWindow2 {tcpSource file} {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now .1$cwnd"
$ns at [expr $now+$time+$time] "plotWindow1 $tcpSource $file" }
$ns at 10.0 "plotWindow1 $tcp $f2" 


# Define node initial position in nam
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 15.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run
