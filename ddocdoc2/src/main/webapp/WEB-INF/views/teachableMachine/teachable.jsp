<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
</head>
<body>
<%@include file="../includes/menu.jsp" %>
<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" id="back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 style="font-size: 35px;">AI Treatment</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../index.html">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                               <!--  <li class="active">가까운 병원찾기</li> -->
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
 <div style="display: flex; justify-content: center; padding-left: 500px; padding-right: 500px; margin-top:30px;">
<button type="button" onclick="init()" class="btn btn-default">영상으로 증상 확인하기</button>
</div>
<div id="webcam-container" style="display: flex; justify-content: center; padding-left: 500px; padding-right: 500px; margin-top:30px;"></div>
<div id="label-container" style="display: flex; justify-content: center; padding-left: 500px; padding-right: 500px; margin-top:30px;"></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "/resources/machineJson/";

    let model, webcam, labelContainer, maxPredictions;

    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(200, 200, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append elements to the DOM
        document.getElementById("webcam-container").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop() {
        webcam.update(); // update the webcam frame
        await predict();
        window.requestAnimationFrame(loop);
    }

    // run the webcam image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
       	if( prediction[0].className == "hong" && prediction[0].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 홍역과 비슷합니다.";
       	}else if( prediction[1].className == "ddod" && prediction[1].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 두드러기와 비슷합니다.";
       	}else if( prediction[2].className == "gunae" && prediction[2].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 구내염과 비슷합니다.";
       	}else if( prediction[3].className == "darae" && prediction[3].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 다래끼와 비슷합니다.";
       	}else if( prediction[4].className == "distortion" && prediction[4].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 염좌와 비슷합니다.";
       	}else if( prediction[5].className == "eyedisease" && prediction[5].probability.toFixed(2) > 0.6){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 눈병과 비슷합니다.";
       	}else if( prediction[6].className == "sujokgu" && prediction[6].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 수족구와 비슷합니다.";
       	}else if( prediction[7].className == "hajijeongmac" && prediction[7].probability.toFixed(2) > 0.7){
       		labelContainer.childNodes[0].innerHTML = "보이는 증상으로는 하지정맥과 비슷합니다.";
       	}else{
       		labelContainer.childNodes[0].innerHTML = "좀 더 정확한 증상을 보여주세요.";
       	}
        
        
        
        /*  for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        } */
    }
</script>

<%@include file="../includes/footer.jsp" %>
</body>
</html>