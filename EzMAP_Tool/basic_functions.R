biom1 = biomformat::read_biom(biom_file = "table-with-taxonomy.biom")

names(biom1)

mp0 = import_biom(biom1)

qsd = import_qiime_sample_data("sample-metadata.tsv")

mp1 = merge_phyloseq(mp0,qsd)

sample_variables(mp1)

treefile1 = "tree.nwk"

tree1 = read_tree(treefile1)

tree1

class(tree1)

bacteria = merge_phyloseq(mp1, tree1)


taxa <- ntaxa(bacteria)
samples <- nsamples(bacteria)
sam_names <- list (sample_variables(bacteria) )
tax_names <- list (rank_names(bacteria))


tax_table(bacteria)[,"Rank1"] %>% unique %>%  length

bacteria %>% sample_data() %>% ncol

library(microbiome)

install.packages("microbiome")

sample_sums(bacteria)




data<-bacteria %>% 
  psmelt %>%
  group_by(Rank2) %>% 
  summarize(OTUn = (unique(OTU) %>% length)) %>% 
  arrange(desc(OTUn))



sam_data <- bacteria
king<-tax_table(sam_data)[,"Rank1"] %>% unique %>%  length
phy<-tax_table(sam_data)[,"Rank2"] %>% unique %>%  length
class<-tax_table(sam_data)[,"Rank3"] %>% unique %>%  length
order<-tax_table(sam_data)[,"Rank4"] %>% unique %>%  length
family<-tax_table(sam_data)[,"Rank5"] %>% unique %>%  length
genus<-tax_table(sam_data)[,"Rank6"] %>% unique %>%  length

first <- c("Kingdoms:","Phylum", "Class", "Order", "Family", "Genus")
second <- c(king,phy,class,order,family,genus)
sam_otu <- data.frame(first,second)




sample_data(bacteria)
tax_table(bacteria)
otu_table(bacteria)

taxa_names(bacteria)

data <- sample_sums(bacteria)


min(data)
max(data)
median(data)
mean(data)





summ = reactive({
  sam_otu=NULL
  sam_data <- bacteria
  king<-tax_table(sam_data)[,"Rank1"] %>% unique %>%  length
  phy<-tax_table(sam_data)[,"Rank2"] %>% unique %>%  length
  class<-tax_table(sam_data)[,"Rank3"] %>% unique %>%  length
  order<-tax_table(sam_data)[,"Rank4"] %>% unique %>%  length
  family<-tax_table(sam_data)[,"Rank5"] %>% unique %>%  length
  genus<-tax_table(sam_data)[,"Rank6"] %>% unique %>%  length
  
  first <- c("Kingdoms","Phylum", "Class", "Order", "Family", "Genus")
  second <- c(king,phy,class,order,family,genus)
  sam_otu <- data.frame(first,second)
  return(sam_otu)
  
})


ggplot(sam_otu,aes_string(x=first, y=second)+ geom_bar() +
  scale_fill_hue(l=40) + xlab("")+ ylab("count") + 
  theme(axis.text.x = element_text(angle = 90)) )
  














