---
title: "CodeBook"
author: "John Poplett"
date: "January 23, 2015"
output: html_document
---

# Study design
The data for the course project comes from the UCI machine learning repository and is self-contained in a zip file. The data in the zip file constitutes the raw data. The data is located here (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

# Code book

Information on the format of the column label naming conventions used by the raw data is provided in the document features_info.txt. The values of features are normalized on a scale of -1 to 1 and are
therefor "unitless".

The values in our dataset is derived from the raw data and is a subset thereof. It consists of those 79 values that represent the mean or standard deviation of samples taken in a sample window.



# Flotsam and Jetsam
This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
