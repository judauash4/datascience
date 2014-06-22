# Lattice Plotting System
# ideal for creating conditional plots where you examine the same kind of plot under many different conditions

# scatterplot
xyplot(y~x|f*g, data, layout=c(5,1))
~ : on the left is y axis, on the right is x axis
* : interaction between variables

xyplot(y~x|f, panel=function(x,y,...){
	panel.xyplot(x,y,...) # First call the default panel function 
	panel.abline(h=median(y), lty=2) # Add a horizontal line at the median of y
})

xyplot(y~x|f, panel=function(x,y,...){
	panel.xyplot(x,y,...) # First call the default panel function 
	panel.lmline(x,y,col=2) # Overlay a simple regression line
})

# boxplot
bwplot

# hist
histogram

# similar to boxplot, but with actual points
stripplot

# plot dots on "violin strings"
dotplot

# scatterplot matrix
splom

# plotting image data
levelplot
contourplot
