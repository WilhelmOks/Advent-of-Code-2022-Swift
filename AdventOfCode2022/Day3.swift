//
//  Day3.swift
//  AdventOfCode2022
//
//  Created by Wilhelm Oks on 04.12.22.
//

import Foundation

private let input = { """
MVWpzTTrTFNNLtssjV
hRJncnJCnhPCnBSbCQRhhQRPFHmsbHLzbLNHsjNNFmGGGsGF
lSBQJBBBBcnccnQvBnPQznfrgwlrTZfDwTfWqrrpgMpw
sRPgrzSgrSbfTrgspBPsDWWTmdnvdZWZwTmwvdmd
tVGpCGqCGjlHcNGVNHZDmnZMWdWMWCdZDvnZ
HqpQptLlclLGtlpcjHNhQqfRhrSBrrbfbrSRrsPfBSgg
JpjLbQbFPBjDBBJLWltglfBfhhlcctht
vNFmsdFsnmzGtWvgzhzc
rqwRCCqmCTqHCnqRNTNFsJVMQSjLRbbVVbjQVLbLSV
mLNNCNDwBwDnmCwnJwLRvdlqZclRccsgvcZndc
QWMtVWbpVlgHHcgMHs
VsTVWhThsVQWzjtQPpVWjWbpwJNCJDCzSNNCCCSfmfBCSGLL
NbSfHnwDvwwfHwwQsHbWPgrsZsZjRPLRgLWhWP
lmMlTGFzVmzqjGLLZWWGhrCh
qFclMprqmrvbcnwDQtNQ
tWQZFvvtWQWbqQQggZZLvpLrpzDrmGDmmDHPzPzHrfnHTG
NMlhlTMccTCVBlRNHzJnzDDmnJmnGGBf
NMMSSSSSlNVMdjdNSNNhFwTbvbLqjbtLwWQwZqgg
jPwcJwRmmhJpbhNJVgDbrHzzzQzzBQHg
tdZqlCnnnlvZCqlnlCSqZdFCHGDBgzsDzssBtHGLQtrHsssL
TZZFSdrdlZMFZRMwMPmNcwNmwm
nsdhzmDBGQWQPvJPjbbW
gCgBqCNpMHTwgwqMPRJJTtWjbFRJFJvP
ZlCwBrwgmzhGzDrd
sTBHfcnBTnqHRvqPgFFbLtrQTPLjjm
GWzpwSJSpbwbNNGJPQrrtrrrrgzLtjzm
NNSlCCdplWwplCwSndnssdZfqVbHvfqc
rrfHgqnlllRrDgrCbQfszMPtmzPQzFsFMQ
JJLGVGjcwVcPQNNNtRPmLM
WThVJJWJBdGwBpBTqDrSRCCggShqbSCb
TbCqzqzmbCffzDbHRddLbdRFRS
ZmvZJPjPwwWNZJGtWSDRRDFWSLhhhMVVWL
ZwplGwmptNjZnjvnGGPjJlZppTrTsCczfggBgfgfggCsBrqr
gMBBbfBbBMfnMsvRvWJhDsQW
ZZqHLzczjjsLzlpjqTprNJvhQpRvtRJJQrtQtJ
llZlzZZzPZZqsTZscHczfnSwSPSwwgSBwwSnPwnf
chMtcPPgQtthqgvczhMTcCSBLBlGpsFnBnnsGvLplSFG
bhRmJWDRmHSmFGBnGBps
jdDZWbrDdDbbdbDrRRWwRjZRVqztCzqtcThcTQtgqVMMVzjq
flNmNHgcZwTzRLzMLRPlzz
nntqBJtFbbCbBVCnBtFjJjhVhLzLvRLvgRRvPvpMpvpp
CgJWjJQDjgBtnGNGfcssNfcwNW
MrMpMrGBznjPMGCmCrrjdwndfJLQNfdLQNdNggdL
sJVcZqvhZtVqhDFFsDJslcdwgwvwQwwQNbbTbwfLLTgL
RDDRcsSsstJstVDDqctszzmRmGjpjBRHPmmGHGrj
tdplZtlrBGwTlLQQ
sfsPPvNhWLQBhGQG
zPVfzVbbMcscvVfzzNgcJHnJZgtrrndJqjJqndrL
nglLjRCCHLLCnNCLHQnFNQmmVMbVmwMwlMwMMMWwBTsT
cqtfcqZpzhSvvBfWwbvrbT
PPqpDSqcSJPdPhtPtqZcpPtGjFRFFFNLJFGRgjFbGRNbHn
gjtRSLMqLdSgLMCltTSDQcQQqhDcfcfrWDhWrr
GwFZCwNzFJsPmFFmZmPPNhvDDfDWWmpvQWWfVDQppW
swNGZbPBGwnCgBBlBljl
BsrDsnQGwFFQQtfNTBNSffBgBt
VJlhWVLlRppLQZTCbtZTttgJ
ppLqqRhQdRPhqPVhdPjhljqHFnGnzFrjFFDznHFHrmwwnH
CJMmmJLmlshCCdmzjHjPWztgdnjttt
GwZvGwrgTcFpzHWjnT
GbqrvrRwbrbGbwwZBbgfhmJMmsDJhNRfLChhCh
CfgfjCLCgfgFgBhBsccswQwtsQHvBBtc
SbSMGbnmDMGJWmRmDmvzwtcscWtQzsrPsvHc
DbJdNpJSnMSJmpSSNVqgqgTTFVQTFqdZLq
MBMCmlllPSSlmmPPjCMpPgggJcnZgntJsDvHsDZt
hrNzhrRNbrhbGRbfpVLRGNqqngvnttngJctgDZJGcZvHvZnc
LTTzVqppSmwdTmQW
mmlBQmLbsbmRnFnwlqqprF
dZScZSZSdHcNMDcJwLqRfppzpzfTpHfF
JLWJLJJJdMmGtgCWjQjt
PPMzpVDblwGVMMzDLLjrcrjdzjdTzLjd
RRcCJRcNQRBqtCFBRJJsZWBWrjLWLHZZWndBLWjh
qQQtttNqsqqtJRgqQfcpcgDcbggplGbfMp
QmmSTQPmLSmjpczMJtwPzg
BHHHdwdvDpllvctjZv
HdrDHNfrrBDGGBhBNfHNsLFqmbRQSwqmGTLnTbSF
gcMmgRQPqqPPsgjFSvctCHvHllSSHcvd
JTWfZwhTwzbWwTFTrZnTrDDlDSVtVHLVShtvSHvlHL
bWbWBfzTfwrWJNbTrnzfTwJFpmMQgqsFRsQGqRMggPmPBG
GqCWpGGLpmpWjbSDGjGGmwCzZlvMBTrCvsrlwwswCl
FPFHFVdJgQHJZnslrgvsTrwMlNgw
hQVchcdcZZpZqcDG
JbBRgBsRffgPPFQttQvQQMvG
dmNZgmZVtGTNtNGC
ZqqndLZnccqRbsrgpggsBc
DDvMVmTjwFWPBBTzBF
cqnggcbNNCqbQQqbZbpfQpqgRWlFhLRBhRzRPLFJhlJBfPLh
dpscpcncbbqcpMVSvSrPDMsrjr
hGCGZmVRRcMVsGMtmZWssmFLzbFblnnzfmqbfnzNNb
wjrSPBJdSjjDrggpSJpdrSnlFNlzLTnqNLqqpbqqfMln
dMwPBHPPJHDdvrBBhshWCGcsQRcHRZGV
vdHwhqdtLdVnHBZbFBFzbBPS
TmNCLNDpWfCNmpCgTWNTDMMZlzSggBMzlZlMBlBbZZ
NQfWcscDNQrhqvGLrdhVjh
lZLqzzqvgrCRcQcCLD
HSVVwNTJzwVNTDQrRrrdrBwdhd
TpNTzsfSTVsSpHVppzFpgvvlqZWZPMvMjPPGGsgP
BCMLshLdLDDCgwFRwHHqqRqRWd
QnSqQlGSfpQzTQJNTPNwNPFRFcccHc
mfJJmztnQpGpvnSzGrsqgrhrBBhqjBrthL
BSlmzmlvdNnlQlQQJnJHRVFVFVVqMtqRMfSfCw
WBPsDPBBjfssFHMRRq
DLWpGhbPjbhZrhZDnBQgdNZmQNgmvdzg
WWvgBFgHWChBzgBFbjbtPtnPrsHlsRMrwRrMRR
SGfNpfdGfVpVSGGppSDdwRwclMlfPMwccsntPqPw
TVdpQDSpQZJpVpDQQFBbthvmWzmgvhbjzJ
VVCCbzqdbzhFHvbdhZFPmhCPSNRNGSrPJfTNRSGJfGwPST
LngtBnlcnDvLcTTRfTTwRtGNTG
DpnBjMpLlLDQWDgvpLvbqzmbjzVjVHqbFFqbFq
SbzMbNQQSDdmvqqzdSlWFpwZnvpFWWllpFww
CjLPTPjjLCPtBCLJjBLPLBTFsFFgfwwpZgplpgFnWWRl
nPncrBHGnmrbdmdmNN
FnlblGlTTbNVLVtRvQQvgqRQBCvgNr
DPMDMpMHmnzjPqDhQWvvQvhghq
zMMcddznsjFTldVGlFGT
cLSNGLhmRRVmlVCq
HvzbQBzBMQMpQDpCSlSVZRSCqV
QwWznWnTbQSMMJQHnvwbWjrhNhLFgsGNNrFLNnFNhd
dBrWNQWWcTNqqnNN
bPlmgRgRghlCVlbhwZccCZjZqvmqvmTTvGqmJTvqnGTGvLLJ
DCDZhjllcpDMrSQS
ddtNNTFTwRzGRGCwqnBMjlqMHMfqnB
hDpPsQLLSprhnHVhqhVfHM
QWLWDQZpgpWbQgfspGGRdcGcCcCcztTGZC
GGHFdGwFlswcFtnvTfjMjBFfNBjNBZ
JWmSJLPSRprWWPWVMMVQpZfBvvfQtj
RzPSPDbDDhbhPDLRhCgGHHccsqGCqqtHzG
dbSdptWddDMNtdFvttFclqMTZJlJTlMZqJTJTqjC
BzfwRzrwPzfzLNGmZZCZBTGBqqlH
hVNVQPNQQQVLPwhRrQwgWWvFdDsFWSbdWgdFSFDb
hhSnmhtZSFSqZBJSSqqmJJRHPPLgHtPcGGGcWGtvvHwgvG
fCMpfTQjTrzrzCQMsQdHGHvPGPwLppPRvWPLLc
MdTzCsCMzNzDCTjlmNhRmRnZBllRVh
RrFglccgBVVvFNvCvWlgmDbbDfQDtCdjjDbDwmZD
STnMqSLHJhHHnqLqtnBndbBdfQQZDtZD
GHJPTBsTSsMMSpSBHJFNlWzcvFlzsVzvzgsv
lplNdrVrVrWMMVcJfcDDzbqCCpDL
SSSgvBRSjggPgzvTTRHTvFnfJLbcLsCDLnCLDCcJBsJq
GmHjjRwvHSjHTRjrlZrNMzVMhVrmVW
gdtFtgStSbHCbHMPZrFLPLrVlrVZrP
hQnjMGfDqTvzvpBjVVjPRLRRjJ
QmsQmhvvMtssHtWw
RNjTGSCLJCGdRqMRFvMrfzMvzz
ZpcWcVDpWBmWQMZZpZDpwBcznrshtntvfvhfFtzmvnzvhf
WHHHcVWgQVCbCllbgMLN
ZjjdJHSdSzvcZFMhhhDqDHtthw
rNTlNqVWTmRPlshsDPDlph
WbTNGNmQBRQbRNQgNGmCLdvvjzcCSBqLcLnScL
bZwpSpBvSHCBqNzpdFffqQft
nWRnGRnVnljmlDnzdPfQfdcQPWWfNq
dmRDGMMlDmnVjgMlhBSwCbCgwHbBHhvv
NwqLgLBLgnwNNBGpgsQsddhhpQQg
JcztcZnzVtZvnVcJMTvTJtWtppsQHGdQhhHHQsPhWdPS
fJTJnMmvZvMvRDqFblNBNNjlBf
drZVzZzzNWWzwwTWTZrjWcLCqnRqNnLNLqCqnsPPRL
JhlBgvHBBLnwMBqDwC
GmGFSHmhJSGJwgFJmwJhJhgQVWVdbSWZQzZTrWtZzjzjTz
wPGRPpnzgwwGgLddFBFrnrnJdc
jCsVclQWmCTrJJddrdFs
lWjlCqfmlWccpGPPSgcf
hCThCzTdPcPhzqTzMfVfHrhMMmhVHgVM
lJSJNqwJsZBSsSBFsMprDmFmFDfDDHgHDf
JNGQsSSNGsbZZZSBwZLPtdLjttnqPCbtPbjC
vnlWNpbrNrpShhQDLRLB
MzCjPgffVTVgCJSRQhBdRdJS
VPHcfcBfTzVMTttMzMfgzMfHvrllWvlnvNvlmGwWNwwNmw
BwwsqPJqwBssLlFqLRCDzWwzDGRGGWfSRG
vTtmmthvpphpnNgNvvpvRrDCddDQrCQCzCDrCfnf
pppccNpTVVlqssHHVzBH
HWHphZWVWvMZNvpMtfJZgssffsjJgBlslJ
RLmrFFnGFrFFrrFCRwCrLNPwqfjSJjqJSJBbsqjbbsblfq
LnFLPPGLrGNRQPmndLzPmPmpcDcMHhcMhVHvczcpHHchcV
zwqqvNDVggwqVfNQRlszFBsCCJFtFlFPsz
MSrrGTZPGSSMSjPbTmtlHBBFrFHFsHlsJsct
MnmMPMSZZGSZWmSjnWgfqdgVQDvnqvRDggDV
SQCSBShsQnSsSJswsNpVppPPMVpGpnDVgg
WWjHvmtWZrwvtzzjTTRPrRRrMVNVVGgVGpGR
lTvWjWLfWwbJCQqBSlbB
cjPChhswrNVtMZJjVM
pfvTFvTzLBFndGTlJmVJZmNlCMGtCJ
nfvFTfpbBFdSFpTLswsWDbchwHCWHrbw
lNdNPLJJLHHHlpPJcvtVcsBBrrBvBqrVrC
wDTbwTQRZTMWsVWtmWhhTr
nzRMbSZtMQDnpzzJHLHNflHP
HrwwmwcRbmwcbrrTbwwcrTJWLlPshllhLccqLhnnlljhZhjZ
GMFMSNSpCBSFSdGpNFpBznLlzzhzshlGhhqPhGGL
nFFSCCSSfttBdddDQNDBQpSSrbrmWJwrHfJHWJrbVwWHrgVr
SdddNNCmpNNDhMswhsmbhvHM
frtzqqqFjgrWfgfqtthsnvRHZRRvFlhnvRZb
rtrgqzzrbWtqLGLLtBWzfGcTNCCVGpSNDppTJJVddNpPSG
WWJvJvBgpHSHScQRQSVQLzqL
ddZTlZGZVfQhZRLLMqsR
rPfwrGGrFjjNTGNCCVBggDJHmNDvbmmpmNJJ
bbGrJPRVPtfsVfFlMjBV
WQzhQQQNZQCWNnQDhzWdNjFZggmlHjjmMmMFjFHpMs
CzQCSWDTWhNhzWhTGJwtRRqTblwcclvP
HLDvZgZldDTnLLsswMpVLn
FNVQzQSPznCMmpBwCF
SqfJPfttqffjJPVlhvhZZtvdVDRZ
jVsLvHvvdrSjpJFsGzmnmltnml
nTNTRCTBTmmmFPMJ
CQnCggWQDgBrrSqHjDDfSS
ZpNlrZNcmctZbcZlmcmZhhpPvPHvwBMHJPMTMHBTFJvJ
zmdCnGzGRnLDjQnzPvMFVHMVMLTVwMJv
GGjqssqgzCnCzQsshcffmrbNrrNZtW
DNpTwhpLlWMDWNMhbJjGttJFHgDcjtjG
wqQrdCdqbFtCtJtJ
vffdrwfPrsmqVBBWRVlRRlTSTWSTlR
ZqTCTQQTFvsDSsBDvWBd
hfBLzRLtHHLDDWRRWWDNbd
pHhhnPzLfJcJhzHLzZjcmwCTqTQgwBqqwg
WJHgqgFqrVrqgqCHwsJHHVFZzppZFGGfTtpcfbdpzzpd
RvNMQlMBhwMdMfcpbM
LLRQNBDSSNSwmDDBQRBRBCHsgrgHLVnJVqLsJsnCPJ
BFhGsDsDsBtsPGtQDrrMdbdrffrffbJbRt
cVVqScVSWWvVWgVZjnrHJgLfdrLrnrLLLQ
WmvqNZzzzZSvVzqvcccSzSmqFGCDTGBPQGDhwCDhNDCwPBQp
RqTlHHTTrQqHlTqsrVDqHbrZFZwhpBhphZBFhZpDpLLLfB
nSzGCGdvzdGNPBQQBfhLZfFwFN
WPPPCJMtJSQMJQCCWMJslRrrRgrMRbRqVqqTRR
BMtfLsLZfTPmCtGWZrZqJNJqvpZdWr
bRwgHhhRhbbSRbjSglcgwHHJWPcJdPrnNWrnqnWVVqpdnq
bgjlSgDljHhjgwMPCLPFDMFPGGBC
zJWjczcWjSWghZgzgSSSZflTqwlfqTTbnQwhdTnMdl
NrGVCmNpHFPsrJFbFQMJbJdQTn
JvrtpHHmrCGJCJmNvNpVCsHVgzWgWDDcjjgjDRStWWDLSgzz
HzdFsBBVsfnTfsPmPtDcZqtMhDDz
wrjjRQLlwwwrJQLQbCrbwlJDSlcSDtPZmPSDclWDtcDqWh
RwgprLbNLrLbCCpRCrJLRLFfsGTNNZHBZnnBvvfffnvd
MlqqlWZclnPtZtDSSvwQQjgQpNQSRM
rLJTsBrsJBhshTNNwSQBWNvNgNSg
JbbbChCHsJzHzbWdGHThlFnnPqlPlGPPGncPtFlD
WcMVvwNNvjRcwTQwVcpNRcspPCFtbPztbCTFmtPtCJtbCzmz
grrgDhrnDLnLrdfdLZlLZhmCqzlCbtJlSSStFmttqsJJ
GHHDdgnLDDhrrrgZrZgLNVVVVcRNvcwjWvpWGcRs
qhGhPSJtGhGtJtvNjnJjnvmNQQmj
sRBFlbZsrdBRRGbVGBDwDMDQwQwMNDjjjVNV
CzCflffbBszdBCbdbrtLcfhhgHLGgPccLSPh
zShhHFzgJWFVFFHFHhRPNjwqPLPtLbtrbwVjjr
ssnvTmvCDfpCZTnsfCqwNLNPwbJqNJPwrjZw
vDvpmcnmnBDnsnJTJmQWMHMWzScFggRFRFSW
nnVHHPLrnpssLnrpLRnHtHrjJcCdzCjcDzMzdqwRdjdDcJ
WWTGQQzSGWlTmBbDJJjwMJjcvvlDjw
TGTWBTWmTbgzghZhgzBgpVNrZPPfntfNrVLNNnZP
TqhQnqqLnnqddttNqQWdtqQmppSSFFClRmzmFZFLSmSlFF
BcHjGclVPPBrVrcjrGGDrMgcmmRJbRCFzpZmSDRpRZJJmRzz
ccGjMgvPvsHMgvBHWlhQdqwtllwNdThs
WjddwRGgHRRdMbrwHRwWjHDtDZplslnJnZrsDvCprJPJ
QSLLFqQBffCFststlFnn
CSSmSqzmVVjWMdMjVWgT
lTfQRhVpRzjThpRQTTTlvHrvBvHnPMHgHqHJvn
cGDctCwCdDCGSFcJsFJsFBvgnMBrHvvrqngHgmgssg
SCbSDSFScNpfbRVVJf
RrwmdwMVjMjMTghDWNTJDpWfWG
SbPvNbvbSsPbSvZsPJtJWhHpGGGgJWgJ
lSFvsLNcqzqLrwnFQMnVdmnn
FgCJFTWntWTFtPLmJmmQJmCMMpljWZBwlGMljjjlwvwBvZ
SDSbVbdScSDzbLZMBrjlZpVrZp
ccsSDhSDffzbLNscfcfDcgqhPgTntqmnQmCgtgQCTJ
VnCnrHnPPrCwHmVWtqfMQQqzCqffCZ
DDbDcJJJbpJDGppFpqGZRWfGfddzMWtfWM
tTTglDcgFjwNPHPPwHlH
bMGbqqgPqqVVMGnbVqSMmRfPcJmCTPDDLJDTCmDm
FFjjZvFRsFCctmtvtJWD
wwFhHjQjwQhZrFjQbngglGbRMnSzgbRH
GPTTJSgTPrPPmcTPpdJsGGGjqbRvqlztqlRqMzGjRv
LwnfWLNwwHHQwHnjbbMMjWttqtMmMj
mhwfBDhnQTpJBcBJps
HQQHwMfwlltzMlVljQhVjjHPPPFGPFcCGprPTPPfDrDcGf
pRLdvRvJgqLRBSJCcvFnCDTPTcTGnT
LBLSJbRSLSqbSdBdgJRRqRbwjHHblQttlwtwhzpjMlwhpw
NWLNSNSDtgSgghgdcwccmwGntwclnT
FRCQzJRsvfVVjvzFJfQnffwCcmdwmHmmHmTwmCmdGBcq
sjfJvjfzPRPzvPPVFMssvSLhSSWrMZnSDNrDDhSLZZ
FvLpSLtCfPCWhRSZZMZJSW
jbbjwbHjQmHjHsQrQFMnwTnJznwRzhJRnNTM
gVrjqGqjgrgsFGLDtDBLLfLB
cgTvRWWLVScRWflNJJDfVJmVlG
nPPnnmqjmZHCHBHFdfwNsDhzzfJznhsfhw
bddmQqQjpdFCQWtLQMMSvMMQRS
wjnmPwCgjPnRlwnmvmvvPnTwbSSLLvsLDWdbbWzvsLzWbzbz
NqrGqFHqJlfhhJGbszdWQzzLNtQDzz
FfHFpphrJqJrpGBffcTnBjCnVTMjMRCnVljT
SrfSJGJpSgMprMHdhBGhsdsshdGsmm
nRTRPvQllQlblwvCjTwLTnvBqdhmHDPVsmDmdqshDVhNsP
lbRFHvRwlnlLbnbjLbLjLCzggSpWfMFzSZpzZFJJWpJr
vNLlFldlvPtHFPHQRt
jcpRsScDgshzjqzfVStntBTPMTnmWttntMpp
fSssgVjDsbqSVbCJClLRJLCZRZZb
wnHmCJccDDcrNnrNMRDtTzpTlMpTzpBp
PjSPPGjWjLzTjjMtzzMj
hWvLLFWvHvczVcVn
jgtngnnhMthcnLjMgCZvChDsmdNCvNNZDN
bWqFPbFbLzRFfZBNDNNPZsNd
RbJzGpzVLLLWHHQgTMwcTptQ
sJBhsMWQnhhrFBsFhlQQMfrDCDpLlVCddjTdDDpqDLTLdj
tZHHSRmNHcgmNzpDPJtttqjLqdpL
HbNbZmcHQJbsFWvs
VgPNWGbgSjGjfhRRFfzThtmtzF
qLCQJBqqcPPmLHhHFz
CcJvplQswNgZlNPSbS
"""
}()

let typePriorities = Array("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

typealias ContentType = [String.Element]

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func day3() {
    let lines = input.split(separator: "\n", omittingEmptySubsequences: false).map { String($0) }
    let rucksacks: [(ContentType, ContentType)] = lines.map { line in
        let characters = Array(line)
        let compartmentSize = characters.count / 2
        let c1 = Array(characters.prefix(compartmentSize))
        let c2 = Array(characters.suffix(compartmentSize))
        return (c1, c2)
    }
    let sharedTypes = rucksacks.map { rucksack in
        Set(rucksack.0).intersection(rucksack.1).first!
    }
    let priorities = sharedTypes.map { typePriorities.firstIndex(of: $0)! }
    let prioritiesSum = priorities.reduce(0) { $0 + $1 }
    
    let groups = lines.chunked(into: 3)
    let badges = groups.map { group in
        let set = Set(group[0]).intersection(Set(group[1])).intersection(Set(group[2]))
        assert(set.count == 1)
        return set.first!
    }
    let badgePriorities = badges.map { typePriorities.firstIndex(of: $0)! }
    let badgePrioritiesSum = badgePriorities.reduce(0) { $0 + $1 }
    
    print("day3 part1 result: \(prioritiesSum)")
    print("day3 part2 result: \(badgePrioritiesSum)") //2644
}
