# Predictive Model
# predicting "price" by all other variables
# use "randomForest"
pricemodel <- randomForest(price ~ . ,data=diamtrain)
pricemodel <- lm(price ~ . ,data=diamtrain)
pricemodel
pricemodel
rmse(pricmodel,diamtrain)
rmse(pricemodel,diamtrain)
mae(pricemodel,diamtrain)
rsquare(pricemodel,diamtrain)
qae(pricemodel,diamtrain)
