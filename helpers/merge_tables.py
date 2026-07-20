#!/usr/bin/env python3
from __future__ import annotations
import argparse
from pathlib import Path
import pandas as pd

def spec(s):
    if ':' not in s: raise argparse.ArgumentTypeError('Use FILE:ID_COLUMN')
    return s.rsplit(':',1)
p=argparse.ArgumentParser(); p.add_argument('--tpm',required=True); p.add_argument('--tpm-id',default='GeneID'); p.add_argument('--table',action='append',default=[],type=spec); p.add_argument('--output',required=True); a=p.parse_args()
merged=pd.read_csv(a.tpm,sep='\t')
for path,idcol in a.table:
    ann=pd.read_csv(path,sep='\t')
    if idcol!=a.tpm_id: ann=ann.rename(columns={idcol:a.tpm_id})
    merged=merged.merge(ann,on=a.tpm_id,how='left',suffixes=('','_dup'))
    merged=merged.loc[:,~merged.columns.str.endswith('_dup')]
Path(a.output).parent.mkdir(parents=True,exist_ok=True)
merged.to_csv(a.output,sep='\t',index=False)
