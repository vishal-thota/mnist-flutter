import tensorflow 
from tensorflow import keras
from tensorflow.keras.datasets import mnist
import PIL
import numpy as np
from tensorflow.keras import Model
from tensorflow.keras import layers
from tensorflow import lite

(x_train, y_train), (x_test, y_test) = mnist.load_data()
# normalizing the data to help with the training
x_train = x_train / 255.0
x_test = x_test/ 255.0
model = tensorflow.keras.Sequential([
  layers.Flatten(input_shape=(28, 28)),
  layers.Dense(128, activation='relu'),
   layers.Dropout(0.2),
  layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
class myCallback(tensorflow.keras.callbacks.Callback):
  def on_epoch_end(self, epoch, logs={}):
    if(logs.get('accuracy')>0.99):
      print("\nReached 99.0% accuracy so cancelling training!")
      self.model.stop_training = True
model.fit(x_train,
          y_train,
          epochs=50,
          callbacks=[myCallback()])
model.evaluate(x_test, y_test)
tensorflow.saved_model.save(model, "mnistt")
converter = tensorflow.lite.TFLiteConverter.from_saved_model('mnistt')
tflite_model=converter.convert()
open("converted_mnist_model.tflite", "wb").write(tflite_model)



