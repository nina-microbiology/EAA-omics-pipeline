#!/usr/bin/env python3
import argparse, shutil
from pathlib import Path
import pandas as pd
p=argparse.ArgumentParser(); p.add_argument('--checkm',required=True); p.add_argument('--bins',required=True); p.add_argument('--output',required=True); p.add_argument('--min-completeness',type=float,default=70); p.add_argument('--max-contamination',type=float,default=10); a=p.parse_args()
df=pd.read_csv(a.checkm,sep='\t'); keep=df[(df['Completeness']>=a.min_completeness)&(df['Contamination']<=a.max_contamination)]
out=Path(a.output); out.mkdir(parents=True,exist_ok=True)
for bid in keep['Bin Id'].astype(str):
    matches=list(Path(a.bins).glob(f'{bid}.*'))
    if matches: shutil.copy2(matches[0],out/matches[0].name)
keep.to_csv(out/'retained_bins.tsv',sep='\t',index=False)
