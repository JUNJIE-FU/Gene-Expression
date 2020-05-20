library(ape)
usage = "
--------------------------------------------------
Given a table, get newick cluster outputs (col and row).
--------------------------------------------------
Usage: 
    Rscript <Program> <input.tsv>
--------------------------------------------------
NOTE:
1. Input.tsv should have genes in row and samples in col.
2. Row-1 and col-1 should be gene names and samples names.
3. Package ape should be installed.
"
argv <- commandArgs(TRUE)
if(length(argv) != 1){stop(paste0("\nWrong num of input files\n",usage))}

tt=read.table(argv[1],header = T,row.names=1,na.strings="-",check.names=FALSE)
if( nrow(tt) >=2 ){
	tt.gene.cl=hclust(dist(tt))
	write.tree(as.phylo(tt.gene.cl),file=paste0(argv[1],".gene.nwk"))
	#gene_tree=write.tree(as.phylo(tt.gene.cl))
	#cat(gene_tree)
}else{
	gene_tree=paste0("(",row.names(tt),":1)")
	#cat(gene_tree)
	write(gene_tree,file=paste0(argv[1],".gene.nwk"))
}

if( ncol(tt) >=2 ){
	tt.sp.cl=hclust(dist(t(tt)))
	write.tree(as.phylo(tt.sp.cl),file=paste0(argv[1],".sample.nwk"))
	#sp_tree=write.tree(as.phylo(tt.sp.cl),file="")
	#cat(sp_tree)
}else{
	sp_tree=paste0("(",names(tt),":1)")
	write(sp_tree,file=paste0(argv[1],".sample.nwk"))
	#cat(sp_tree)
}
