import cv2
import numpy as np

img = cv2.imread('tuning_grey_3.jpg')
img = cv2.resize(img, (640, 480)) 
img = cv2.GaussianBlur(img, (5, 5), 0)
# img = cv2.medianBlur(img,5)
hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

# define range of red color in HSV
lower_red = np.array([0,60,60])
upper_red = np.array([10,255,255])

# define range of green color in hsv
lower_green = np.array([50,115,75])
upper_green = np.array([65,255,255])


# define range of blue color in HSV
lower_blue = np.array([80,60,60])
upper_blue = np.array([100,255,255])

# define range of yellow color in hsv
lower_yellow = np.array([10,100,80])
upper_yellow = np.array([30,255,255])

# define range of grey color in hsv
lower_grey = np.array([20,10,20])
upper_grey = np.array([50,150,50])

# Threshold the HSV image to get only blue colors
green_mask = cv2.inRange(hsv, lower_green, upper_green)
red_mask =  cv2.inRange(hsv, lower_red, upper_red)
blue_mask =  cv2.inRange(hsv, lower_blue, upper_blue)
yellow_mask =  cv2.inRange(hsv, lower_yellow, upper_yellow)
grey_mask =  cv2.inRange(hsv, lower_grey, upper_grey)
# mask = grey_mask

mask = green_mask + red_mask + blue_mask+ yellow_mask + grey_mask
# # Bitwise-AND mask and original image
res = cv2.bitwise_and(img, img, mask= mask)

kernel = np.ones((5,5),np.uint8)
h,s,v = cv2.split(res)
erosion = cv2.erode(v,kernel,iterations = 1)
dilation = cv2.dilate(erosion,kernel,iterations = 1)

edges = cv2.Canny(dilation,100,200)

while(1):
    cv2.imshow('frame',img)
    # cv2.imshow('mask',mask)
    cv2.imshow('res',res)
    cv2.imshow('erosion',erosion)
    cv2.imshow('dilation',dilation)
    cv2.imshow('edge',edges)
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break
cv2.destroyAllWindows()
