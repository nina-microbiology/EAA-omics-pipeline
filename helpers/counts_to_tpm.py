#!/usr/bin/env python3
from __future__ import annotations
import argparse
from pathlib import Path
import pandas as pd

p=argparse.ArgumentParser(); p.add_argument('--counts',required=True); p.add_argument('--output',required=True); a=p.parse_args()
df=pd.read_csv(a.counts,sep='\t',comment='#')
for c in ('Geneid','Length'):
    if c not in df.columns: raise ValueError(f'Missing required featureCounts column: {c}')
meta=['Geneid','Chr','Start','End','Strand','Length']
samples=[c for c in df.columns if c not in meta]
length_kb=df['Length'].astype(float)/1000.0
out=pd.DataFrame({'GeneID':df['Geneid']})
for c in samples:
    counts=pd.to_numeric(df[c],errors='coerce').fillna(0.0)
    rpk=counts/length_kb
    denom=rpk.sum()
    out[Path(c).stem]=0.0 if denom==0 else rpk/denom*1_000_000
Path(a.output).parent.mkdir(parents=True,exist_ok=True)
out.to_csv(a.output,sep='\t',index=False)
