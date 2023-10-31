import cv2, sys
cap1 = cv2.VideoCapture("https://192.168.4.3:8080/video")

while cv2.waitKey(1) != 27:
    ret, frame1 = cap1.read()
    if ret:
        cv2.imshow("frame1", frame1)
    else:
        print("err frame")
