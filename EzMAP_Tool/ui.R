# Define generic graphic-type select UI.
# `graphicFormats` is defined globally, called by global.R when it sources ggsave.R
graphicTypeUI = function(inputId, label="Format", choices=graphicFormats, selected="pdf"){
  selectInput(inputId, label, choices, selected, multiple = FALSE, selectize = TRUE)
}
# Type for distance/network/ordination/etc. Samples/Taxa toggle
uitype = function(id="type", selected="taxa"){
  selectInput(inputId=id, label="Type",
              selected=selected,
              choices=list("Taxa"="taxa", "Samples"="samples"))
}
# ui for point size
uiptsz = function(id, ...){
  numericInputRow(inputId=id, label="Size", min=1, max=NA, value=5, step=1, ...)
}
# ui for point opacity slider
uialpha = function(id, ...){
  numericInputRow(inputId=id, label="Opacity", min=0, max=1, value=1, step=0.1, ...)
}
# UI function to define palettes. Reused in many panels.
uipal = function(id, default="Set1"){
  selectInput(id, "Palette",  
              choices = rownames(RColorBrewer::brewer.pal.info), 
              selected = default
  )
}
# UI function to define ggplot2 themes. Reused in many panels.
uitheme = function(id, default="bl_wh"){
  selectInput(id, "Theme",
              choices = names(shiny_phyloseq_ggtheme_list),
              selected = default
  )
}
################################################################################
# Multi-Widget Definitions
################################################################################
# Figure Dimensions and Download. Should return a single fluidRow, all 12 cols
dim_and_down = function(suffix, secTitle='Dimensions & Download'){
  fluidRow(column(
    width = 12,
    h4(secTitle),
    div(class="col-md-3", numericInputRow(paste0("width", suffix), "Width", 8, 1, 100, 1, class="col-md-12")),
    div(class="col-md-3", numericInputRow(paste0("height", suffix), "Height", 8, 1, 100, 1, class="col-md-12")),
    div(class='col-md-3', graphicTypeUI(paste0("downtype", suffix))),
    div(class='col-md-2', div(style="display:inline-block", tags$label("DL"),
                           downloadButton(paste0("download", suffix), '  ')))
  ))
}
# Theme and details. Some elements are optional. Suffix is required.
# Attempts to return a single row with palette, theme, and optionally point-size and opacity.
# `addList` is a list of additional elements for UI, attempt to add to row.
theme_ui_details = function(suffix, secTitle="Details", addList=NULL){
  elementList = list(width = 12, h4(secTitle))
  
  
  # Add any additional row elements, if present
  elementList <- c(elementList, addList)
  return(fluidRow(do.call("column", args = elementList)))
}
# # Generic fluid row-split. r is number of elements in a row (max 12). 
# ui_row_split = function(..., r=2L){
#   elementList = list(width = 12L)
#   spanN = paste0("col-md-", floor(12/r))
#   elementList <- c(elementList,
#                    lapply(..., function(x, spanN){div(class=col-md-N, x)}, spanN))
#   return(fluidRow(do.call("column", args = elementList)))
# }
################################################################################
# Generic distance UI stuff.
################################################################################
#   Function to reate ui for distance method selection
#   NOTE: not all distance methods are supported if "taxa" selected for type. 
#   For example, the UniFrac distance and DPCoA cannot be calculated for taxa-wise 
#   distances, because they use a taxa-wise tree as part of their calculation 
#   between samples, and there is no transpose-equivalent for this tree
uidist = function(id, selected="bray"){
  return(selectInput(id, "Distance", distlist, selected=selected))
}
# Whether to use proportions or counts
uicttype = function(id="uicttype"){
  selectInput(inputId=id, label="Data",
               choices=c("Counts", "Proportions"),
               selected="Counts")
}
################################################################################
# Generic Ordination UI stuff.
################################################################################
# Define the ordination options list.
# Make available to other panels, if relevant.
ordlist <- as.list(phyloseq::ordinate("list"))
names(ordlist) <- ordlist
ordlist = ordlist[which(ordlist %in% c("PCoA"))]
################################################################################
# Define each fluid page
################################################################################
# Define in a single function, a standard definition of panel-page
make_fluidpage = function(fptitle="", sbp, outplotid, markdownDoc=""){
  mdRow = fluidRow(column(width = 12, " "))
  if(nchar(markdownDoc) > 0){
    # If md doc specified, replace `mdRow` with actual doc.
    mdRow <- fluidRow(column(width = 12,
      includeMarkdown(file.path("panels/paneldoc", markdownDoc))
    )) 
  }
  fluidPage(
    headerPanel(fptitle, "windowTitle"), 
    fluidRow(sbp, column(width=8, plotOutput(outplotid))),
    mdRow
  )
}
################################################################################

#source("panels/panel-ui-palette.R", local = TRUE)
source("panels/panel-ui-ordination.R", local = TRUE)
source("panels/panel-ui-richness.R", local = TRUE)
source("panels/panel-ui-data.R", local = TRUE)
source("panels/panel-ui-filter.R", local = TRUE)
source("panels/panel-ui-sample.R", local = TRUE)
source("panels/panel-ui-barplot.R", local = TRUE)
source("panels/panel-ui-rarefaction.R", local = TRUE)
source("panels/panel-ui-view.R", local = TRUE)
source("panels/panel-ui-preprocessing.R", local = TRUE)
source("panels/panel-ui-deseq2.R", local = TRUE)
source("panels/panel-ui-fa.R", local = TRUE)




################################################################################
# Define general header tag list 
# List of tags to display as a common header above all tabPanels.
################################################################################
headerTagList = list(
  tags$style(type="text/css", ".phyloseq-print { font-size: 15px; }"),
  tags$base(target="_blank")
)
################################################################################
# Define the full user-interface, `ui`
################################################################################
ui = navbarPage(
  title = h5(style="color:#C70039",  "EzMAP"),
  tabPanel("Select Dataset", datapage),
  tabPanel("Filter", filterpage),
  tabPanel("View", viewpage),
  tabPanel("Summary", samplepage),
  tabPanel("Rarefaction", alphaplotpage),
  tabPanel("Taxonomy", barplotpage),
  tabPanel("Alpha Diversity", richpage),
  tabPanel("Beta Diversity", ordpage),
  tabPanel("DA Analysis", deseqpage),
  tabPanel("Function Prediction", fapage),
  
  
  
  header = headerTagList,
  collapsible = TRUE,
  windowTitle = "EzMAP"
)
shinyUI(ui)
################################################################################
