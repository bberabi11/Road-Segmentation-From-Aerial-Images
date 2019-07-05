# cil project road segmentation using aerial images with unet

this folder should have following subfolders and files:

--data: put the downloaded data under this folder after unzipping training
in the subfolders called "training" and "test_images"
after augmentations, one can choose to save the augmented files as well (obviously under training)
valdiation data created in train.py

--weights: use this folder to save weights for models, has the model weights under which was 
trained for 10 epochs and gives:
loss: 0.1135 - f1: 0.8865 - acc: 0.9562 - val_loss: 0.1408 - val_f1: 0.8592 - val_acc: 0.9538

--subs: use this to send submission after prediction is done

--preds: Save the predictions of test images. It is especially useful for visual inspection of the model output.

--preprocess.py: has generators for train, val and test data, with augmentations in train generator

--model.py: unet implementation

--train.py: trains the model and makes predictions. saves the submission
 * Weights of the model are saved after each epoch (if there is any progress in validation loss!) under weights folder.
 * Predictions after the training are saved under preds folder
 * Submission for Kaggle is saved under subs folder. 

--pred_sub_only.py: for those who don't want to train but use the weights under the weights folder. This script also allows doing predicitons with multiple weights and average over. 

--mask_to_submission.py: contains helpers for submission

--metrics.py: contains f1 score and other related calculations. 

Note: If one wants to ensemble different methods (i.e. training on differently pre-processed data), the following steps can be taken:
 * For all different preprocess techniques:
  * Update preprocess.py
  * Run train.py
  * Observe the saved weights for the best validation score
 * Open pred_sub_only.py and put the names of the weights into the array called weights
 * Submission.csv will contain the predictions of ensembled methods.
