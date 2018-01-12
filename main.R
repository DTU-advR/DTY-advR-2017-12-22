library(broom)

set.seed(1459)
x <- 1L:10 + rnorm(10)
y <- 1L:10

# htest objects -------------------------- 
(cor_test <- cor.test(x = x, y = y))

str(cor_test)

# glance - a very brief summary
glance(cor_test)


wilcoxon_test <- wilcox.test(x = x, y = y)
glance(wilcoxon_test)

# lm objects ---------------------------------

(iris_model <- lm(Sepal.Length ~ Petal.Length + Species, data = iris))

str(iris_model) # no adjusted r^2
summary(iris_model)
str(summary(iris_model))

glance(iris_model)

# tidy - a model in a data.frame format (term-wise)
tidy(iris_model)

# augment - expand the input data using residuals and so on
augment(iris_model)

# aov objects ---------------------------------
(npk_model <- aov(yield ~ block + N * P + K, npk))

summary(npk_model)
tidy(npk_model)

augment(npk_model)


# Stan objects
library(rstan)

schools_dat <- list(J = 8, 
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))

fit <- stan(file = "8schools.stan", data = schools_dat, 
            iter = 1000, chains = 4)

str(fit)
summary(fit)
dim(summary(fit)[[2]])

tidy(fit)

# other packages: sweep: tidy data for time series: https://github.com/business-science/sweep 
