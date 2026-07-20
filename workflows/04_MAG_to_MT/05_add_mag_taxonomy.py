#!/usr/bin/env python3
import argparse
from pathlib import Path
import pandas as pd
p=argparse.ArgumentParser(); p.add_argument('--expression',required=True); p.add_argument('--taxonomy',required=True); p.add_argument('--gene-mag-map',required=True); p.add_argument('--output',required=True); a=p.parse_args()
e=pd.read_csv(a.expression,sep='\t'); g=pd.read_csv(a.gene_mag_map,sep='\t'); t=pd.read_csv(a.taxonomy,sep='\t'); o=e.merge(g,on='GeneID',how='left').merge(t,on='MAG_ID',how='left'); Path(a.output).parent.mkdir(parents=True,exist_ok=True); o.to_csv(a.output,sep='\t',index=False)
