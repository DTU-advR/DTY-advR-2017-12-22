library(broom)

set.seed(1459)

# htest objects -------------------------- 
(cor_test <- cor.test(x = 1L:10 + rnorm(10), y = 1L:10))

str(cor_test)

glance(cor_test)

# lm objects ---------------------------------

iris_model <- lm(Sepal.Length ~ Petal.Length + Species, data = iris)

str(iris_model) # no adjusted r^2
summary(iris_model)
str(summary(iris_model))

glance(iris_model)
tidy(iris_model)
augment(iris_model)

# aov objects ---------------------------------
npk_model <- aov(yield ~ block + N * P + K, npk)

glance(npk_model)
tidy(npk_model)
augment(npk_model)

# kmeans objects


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

