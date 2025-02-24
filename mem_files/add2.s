li	gp,2
auipc	sp,0x2
addi	sp,sp,-400 # 80002000 <begin_signature>
li	ra,-35
sb	ra,0(sp)
lb	a4,0(sp)
li	t2,-35
bne	a4,t2, .fail


li	gp,3
auipc	sp,0x2
addi	sp,sp,-432 # 80002000 <begin_signature>
li	ra,-51
sb	ra,1(sp)
lb	a4,1(sp)
li	t2,-51
bne	a4,t2, .fail


li	gp,4
auipc	sp,0x2
addi	sp,sp,-464 # 80002000 <begin_signature>
li	ra,-52
sb	ra,2(sp)
lb	a4,2(sp)
li	t2,-52
bne	a4,t2, .fail


li	gp,5
auipc	sp,0x2
addi	sp,sp,-496 # 80002000 <begin_signature>
li	ra,-68
sb	ra,3(sp)
lb	a4,3(sp)
li	t2,-68
bne	a4,t2, .fail


li	gp,6
auipc	sp,0x2
addi	sp,sp,-528 # 80002000 <begin_signature>
li	ra,-69
sb	ra,4(sp)
lb	a4,4(sp)
li	t2,-69
bne	a4,t2, .fail


li	gp,7
auipc	sp,0x2
addi	sp,sp,-560 # 80002000 <begin_signature>
li	ra,-85
sb	ra,5(sp)
lb	a4,5(sp)
li	t2,-85
bne	a4,t2, .fail


li	gp,8
auipc	sp,0x2
addi	sp,sp,-592 # 80002000 <begin_signature>
li	ra,51
sb	ra,0(sp)
lb	a4,0(sp)
li	t2,51
bne	a4,t2, .fail


li	gp,9
auipc	sp,0x2
addi	sp,sp,-624 # 80002000 <begin_signature>
li	ra,35
sb	ra,1(sp)
lb	a4,1(sp)
li	t2,35
bne	a4,t2, .fail


li	gp,10
auipc	sp,0x2
addi	sp,sp,-656 # 80002000 <begin_signature>
li	ra,34
sb	ra,2(sp)
lb	a4,2(sp)
li	t2,34
bne	a4,t2, .fail


li	gp,11
auipc	sp,0x2
addi	sp,sp,-688 # 80002000 <begin_signature>
li	ra,18
sb	ra,3(sp)
lb	a4,3(sp)
li	t2,18
bne	a4,t2, .fail


li	gp,12
auipc	sp,0x2
addi	sp,sp,-720 # 80002000 <begin_signature>
li	ra,17
sb	ra,4(sp)
lb	a4,4(sp)
li	t2,17
bne	a4,t2, .fail


li	gp,13
auipc	sp,0x2
addi	sp,sp,-752 # 80002000 <begin_signature>
li	ra,1
sb	ra,5(sp)
lb	a4,5(sp)
li	t2,1
bne	a4,t2, .fail


li	gp,14
auipc	sp,0x2
addi	sp,sp,-784 # 80002000 <begin_signature>
li	ra,51
sb	ra,0(sp)
lbu	a4,0(sp)
li	t2,51
bne	a4,t2, .fail


li	gp,15
auipc	sp,0x2
addi	sp,sp,-816 # 80002000 <begin_signature>
li	ra,35
sb	ra,1(sp)
lbu	a4,1(sp)
li	t2,35
bne	a4,t2, .fail


li	gp,16
auipc	sp,0x2
addi	sp,sp,-848 # 80002000 <begin_signature>
li	ra,34
sb	ra,2(sp)
lbu	a4,2(sp)
li	t2,34
bne	a4,t2, .fail


li	gp,17
auipc	sp,0x2
addi	sp,sp,-880 # 80002000 <begin_signature>
li	ra,18
sb	ra,3(sp)
lbu	a4,3(sp)
li	t2,18
bne	a4,t2, .fail


li	gp,18
auipc	sp,0x2
addi	sp,sp,-912 # 80002000 <begin_signature>
li	ra,17
sb	ra,4(sp)
lbu	a4,4(sp)
li	t2,17
bne	a4,t2, .fail


li	gp,19
auipc	sp,0x2
addi	sp,sp,-944 # 80002000 <begin_signature>
li	ra,1
sb	ra,5(sp)
lbu	a4,5(sp)
li	t2,1
bne	a4,t2, .fail


li	gp,20
auipc	sp,0x2
addi	sp,sp,-976 # 80002000 <begin_signature>
lui	ra,0xaabbd
addi	ra,ra,-803 # aabbccdd <_end+0x2abbac8d>
sw	ra,0(sp)
lw	a4,0(sp)
lui	t2,0xaabbd
addi	t2,t2,-803 # aabbccdd <_end+0x2abbac8d>
bne	a4,t2, .fail


li	gp,21
auipc	sp,0x2
addi	sp,sp,-1016 # 80002000 <begin_signature>
lui	ra,0xdaabc
addi	ra,ra,-819 # daabbccd <_end+0x5aab9c7d>
sw	ra,4(sp)
lw	a4,4(sp)
lui	t2,0xdaabc
addi	t2,t2,-819 # daabbccd <_end+0x5aab9c7d>
bne	a4,t2, .fail


li	gp,22
auipc	sp,0x2
addi	sp,sp,-1056 # 80002000 <begin_signature>
lui	ra,0xddaac
addi	ra,ra,-1076 # ddaabbcc <_end+0x5daa9b7c>
sw	ra,8(sp)
lw	a4,8(sp)
lui	t2,0xddaac
addi	t2,t2,-1076 # ddaabbcc <_end+0x5daa9b7c>
bne	a4,t2, .fail


li	gp,23
auipc	sp,0x2
addi	sp,sp,-1096 # 80002000 <begin_signature>
lui	ra,0xcddab
addi	ra,ra,-1092 # cddaabbc <_end+0x4dda8b6c>
sw	ra,12(sp)
lw	a4,12(sp)
lui	t2,0xcddab
addi	t2,t2,-1092 # cddaabbc <_end+0x4dda8b6c>
bne	a4,t2, .fail


li	gp,24
auipc	sp,0x2
addi	sp,sp,-1136 # 80002000 <begin_signature>
lui	ra,0xccddb
addi	ra,ra,-1349 # ccddaabb <_end+0x4cdd8a6b>
sw	ra,16(sp)
lw	a4,16(sp)
lui	t2,0xccddb
addi	t2,t2,-1349 # ccddaabb <_end+0x4cdd8a6b>
bne	a4,t2, .fail


li	gp,25
auipc	sp,0x2
addi	sp,sp,-1176 # 80002000 <begin_signature>
lui	ra,0xbccde
addi	ra,ra,-1365 # bccddaab <_end+0x3ccdba5b>
sw	ra,20(sp)
lw	a4,20(sp)
lui	t2,0xbccde
addi	t2,t2,-1365 # bccddaab <_end+0x3ccdba5b>
bne	a4,t2, .fail


li	gp,26
auipc	sp,0x2
addi	sp,sp,-1216 # 80002000 <begin_signature>
lui	ra,0x112
addi	ra,ra,563 # 112233 <_start-0x7feeddcd>
sw	ra,0(sp)
lw	a4,0(sp)
lui	t2,0x112
addi	t2,t2,563 # 112233 <_start-0x7feeddcd>
bne	a4,t2, .fail


li	gp,27
auipc	sp,0x2
addi	sp,sp,-1256 # 80002000 <begin_signature>
lui	ra,0x30011
addi	ra,ra,547 # 30011223 <_start-0x4ffeeddd>
sw	ra,4(sp)
lw	a4,4(sp)
lui	t2,0x30011
addi	t2,t2,547 # 30011223 <_start-0x4ffeeddd>
bne	a4,t2, .fail


li	gp,28
auipc	sp,0x2
addi	sp,sp,-1296 # 80002000 <begin_signature>
lui	ra,0x33001
addi	ra,ra,290 # 33001122 <_start-0x4cffeede>
sw	ra,8(sp)
lw	a4,8(sp)
lui	t2,0x33001
addi	t2,t2,290 # 33001122 <_start-0x4cffeede>
bne	a4,t2, .fail


li	gp,29
auipc	sp,0x2
addi	sp,sp,-1336 # 80002000 <begin_signature>
lui	ra,0x23300
addi	ra,ra,274 # 23300112 <_start-0x5ccffeee>
sw	ra,12(sp)
lw	a4,12(sp)
lui	t2,0x23300
addi	t2,t2,274 # 23300112 <_start-0x5ccffeee>
bne	a4,t2, .fail


li	gp,30
auipc	sp,0x2
addi	sp,sp,-1376 # 80002000 <begin_signature>
lui	ra,0x22330
addi	ra,ra,17 # 22330011 <_start-0x5dccffef>
sw	ra,16(sp)
lw	a4,16(sp)
lui	t2,0x22330
addi	t2,t2,17 # 22330011 <_start-0x5dccffef>
bne	a4,t2, .fail


li	gp,31
auipc	sp,0x2
addi	sp,sp,-1416 # 80002000 <begin_signature>
lui	ra,0x12233
addi	ra,ra,1 # 12233001 <_start-0x6ddccfff>
sw	ra,20(sp)
lw	a4,20(sp)
lui	t2,0x12233
addi	t2,t2,1 # 12233001 <_start-0x6ddccfff>
bne	a4,t2, .fail


li	gp,32
auipc	sp,0x2
addi	sp,sp,-1456 # 80002000 <begin_signature>
lui	ra,0xffffd
addi	ra,ra,-803 # ffffccdd <_end+0x7fffac8d>
sh	ra,0(sp)
lh	a4,0(sp)
lui	t2,0xffffd
addi	t2,t2,-803 # ffffccdd <_end+0x7fffac8d>
bne	a4,t2, .fail


li	gp,33
auipc	sp,0x2
addi	sp,sp,-1496 # 80002000 <begin_signature>
lui	ra,0xffffc
addi	ra,ra,-819 # ffffbccd <_end+0x7fff9c7d>
sh	ra,2(sp)
lh	a4,2(sp)
lui	t2,0xffffc
addi	t2,t2,-819 # ffffbccd <_end+0x7fff9c7d>
bne	a4,t2, .fail


li	gp,34
auipc	sp,0x2
addi	sp,sp,-1536 # 80002000 <begin_signature>
lui	ra,0xffffc
addi	ra,ra,-1076 # ffffbbcc <_end+0x7fff9b7c>
sh	ra,4(sp)
lh	a4,4(sp)
lui	t2,0xffffc
addi	t2,t2,-1076 # ffffbbcc <_end+0x7fff9b7c>
bne	a4,t2, .fail


li	gp,35
auipc	sp,0x2
addi	sp,sp,-1576 # 80002000 <begin_signature>
lui	ra,0xffffb
addi	ra,ra,-1092 # ffffabbc <_end+0x7fff8b6c>
sh	ra,6(sp)
lh	a4,6(sp)
lui	t2,0xffffb
addi	t2,t2,-1092 # ffffabbc <_end+0x7fff8b6c>
bne	a4,t2, .fail


li	gp,36
auipc	sp,0x2
addi	sp,sp,-1616 # 80002000 <begin_signature>
lui	ra,0xffffb
addi	ra,ra,-1349 # ffffaabb <_end+0x7fff8a6b>
sh	ra,8(sp)
lh	a4,8(sp)
lui	t2,0xffffb
addi	t2,t2,-1349 # ffffaabb <_end+0x7fff8a6b>
bne	a4,t2, .fail


li	gp,37
auipc	sp,0x2
addi	sp,sp,-1656 # 80002000 <begin_signature>
lui	ra,0xffffe
addi	ra,ra,-1365 # ffffdaab <_end+0x7fffba5b>
sh	ra,10(sp)
lh	a4,10(sp)
lui	t2,0xffffe
addi	t2,t2,-1365 # ffffdaab <_end+0x7fffba5b>
bne	a4,t2, .fail


li	gp,38
auipc	sp,0x2
addi	sp,sp,-1696 # 80002000 <begin_signature>
lui	ra,0x2
addi	ra,ra,563 # 2233 <_start-0x7fffddcd>
sh	ra,0(sp)
lh	a4,0(sp)
lui	t2,0x2
addi	t2,t2,563 # 2233 <_start-0x7fffddcd>
bne	a4,t2, .fail


li	gp,39
auipc	sp,0x2
addi	sp,sp,-1736 # 80002000 <begin_signature>
lui	ra,0x1
addi	ra,ra,547 # 1223 <_start-0x7fffeddd>
sh	ra,2(sp)
lh	a4,2(sp)
lui	t2,0x1
addi	t2,t2,547 # 1223 <_start-0x7fffeddd>
bne	a4,t2, .fail


li	gp,40
auipc	sp,0x2
addi	sp,sp,-1776 # 80002000 <begin_signature>
lui	ra,0x1
addi	ra,ra,290 # 1122 <_start-0x7fffeede>
sh	ra,4(sp)
lh	a4,4(sp)
lui	t2,0x1
addi	t2,t2,290 # 1122 <_start-0x7fffeede>
bne	a4,t2, .fail


li	gp,41
auipc	sp,0x2
addi	sp,sp,-1816 # 80002000 <begin_signature>
li	ra,274
sh	ra,6(sp)
lh	a4,6(sp)
li	t2,274
bne	a4,t2, .fail


li	gp,42
auipc	sp,0x2
addi	sp,sp,-1848 # 80002000 <begin_signature>
li	ra,17
sh	ra,8(sp)
lh	a4,8(sp)
li	t2,17
bne	a4,t2, .fail


li	gp,43
auipc	sp,0x2
addi	sp,sp,-1880 # 80002000 <begin_signature>
lui	ra,0x3
addi	ra,ra,1 # 3001 <_start-0x7fffcfff>
sh	ra,10(sp)
lh	a4,10(sp)
lui	t2,0x3
addi	t2,t2,1 # 3001 <_start-0x7fffcfff>
bne	a4,t2, .fail


li	gp,44
auipc	sp,0x2
addi	sp,sp,-1920 # 80002000 <begin_signature>
lui	ra,0x2
addi	ra,ra,563 # 2233 <_start-0x7fffddcd>
sh	ra,0(sp)
lhu	a4,0(sp)
lui	t2,0x2
addi	t2,t2,563 # 2233 <_start-0x7fffddcd>
bne	a4,t2, .fail


li	gp,45
auipc	sp,0x2
addi	sp,sp,-1960 # 80002000 <begin_signature>
lui	ra,0x1
addi	ra,ra,547 # 1223 <_start-0x7fffeddd>
sh	ra,2(sp)
lhu	a4,2(sp)
lui	t2,0x1
addi	t2,t2,547 # 1223 <_start-0x7fffeddd>
bne	a4,t2, .fail


li	gp,46
auipc	sp,0x2
addi	sp,sp,-2000 # 80002000 <begin_signature>
lui	ra,0x1
addi	ra,ra,290 # 1122 <_start-0x7fffeede>
sh	ra,4(sp)
lhu	a4,4(sp)
lui	t2,0x1
addi	t2,t2,290 # 1122 <_start-0x7fffeede>
bne	a4,t2, .fail


li	gp,47
auipc	sp,0x2
addi	sp,sp,-2040 # 80002000 <begin_signature>
li	ra,274
sh	ra,6(sp)
lhu	a4,6(sp)
li	t2,274
bne	a4,t2, .fail


li	gp,48
auipc	sp,0x1
addi	sp,sp,2024 # 80002000 <begin_signature>
li	ra,17
sh	ra,8(sp)
lhu	a4,8(sp)
li	t2,17
bne	a4,t2, .fail
j .pass

  .fail:
nop
  nop
  nop
  nop
  j .fail

  .pass:
nop
nop
nop
nop
j .pass
