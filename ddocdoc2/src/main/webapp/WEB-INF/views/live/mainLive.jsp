<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/resources/js/lib/inherit.js"></script>
<script src="/resources/js/lib/jquery.js"></script>
<script src="/resources/js/lib/eventemitter.js"></script>
<script src="/resources/js/lib/DetectRTC.js"></script>
<script src="/resources/js/lib/utils.js"></script>
<script src="https://192.168.0.51:3001/socket.io/socket.io.js"></script>
<script src="/resources/js/modules/peer-handler.js"></script>
<script src="/resources/js/modules/media-handler.js"></script>
<script src="/resources/js/modules/main.js"></script>
<style>
input[type='text'] {
  padding: 6px 10px;
  width: 120px;
  height: 30px;
  border: solid 1px #bbb;
  font-size: 1.3em;
}

.wrap {
  margin-top: 30px;
  position: relative;
  font-size: 1.2em;
  text-align: center;
}

.wrap p {
  font-size: 1.25em;
}

.wrap button {
  margin-top: 20px;
  min-width: 80px;
  vertical-align: top;
}

.room-info {
  vertical-align: top;
}

/********************************************
  Below room style
*********************************************/
video {
  margin: 0 0 20px 0;
  width: 100%;
  z-index: 1;
  background: #222;
  border: solid 1px #fff;
  transition: all 0.6s ease-out;
}

video.effect {
  transform: scale(1, 1);
}

#video-wrap {
  display: none;
  position: relative;
  margin: 0 auto;
  min-height: 620px;
}

#video-wrap .buttons {
  position: absolute;
  bottom: 0;
}

#local {
  position: absolute;
  top: 4%;
  right: 2%;
  width: 340px;
  height: 220px;
  border: solid 1px #fff;
}

#local-video {
  position: absolute;
  top: 0;
  left: 0;
}

#share-wrap {
  display: none;
  margin: 10px 0;
}

.room #enter-wrap,
.connected #create-wrap,
.connected #wait-wrap {
  display: none;
}
.connected #local-video {
  top: 2px;
  left: 2px !important;
  width: 150px !important;
  border: solid 1px #fff;
  z-index: 2;
}

.room #share-wrap {
  display: block;
}

.room #wait-wrap {
  display: none;
}

.room #video-wrap {
  display: block;
}

.room #content {
  padding-top: 30px;
}

</style>
</head>
<body>
<!-- 
<div id="content">
  <div class="wrap">
    <section id="share-wrap">
      <a href="#" id="unique-token">Share this room link</a>
    </section>

    <section id="enter-wrap">
      <div id="create-wrap">
        <p>Live상담방 열기</p>
        <button id="btn-start">Start</button>
      </div>
      <div id="wait-wrap"></div>
    </section>

    <section id="video-wrap">
      <div class="buttons">
        <button id="btn-camera">Camera Pause</button>
        <button id="btn-mic">Mic Mute</button>
      </div>
    </section>
  </div>
</div> -->

</body>
</html>