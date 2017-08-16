particlesJS('particles-js',
  {
      "particles": {
          "number": {  // 节点数量
              "value": 20,
              "density": {  // 区域散布密度大小 默认800 越大好像越稀
                  "enable": true,
                  "value_area": 800  
              }
          },
          "color": {
              "value": "#888888"
          },
          "shape": {
              "type": ["circle"],  // 节点样式
              "stroke": {  // 原子边框宽度 颜色
                  "width": 0,
                  "color": "#888888"
              },
              "polygon": { // 原子多边形边数
                  "nb_sides": 5
              },
              "image": { // 自定义原子图片
                  "src": "img/github.svg",
                  "width": 100,
                  "height": 100
              }
          },
          "opacity": {  // 原子透明度
              "value": 0.2,
              "random": false,  // 随机不透明
              "anim": {  // 渐变动画
                  "enable": false,
                  "speed": 1,
                  "opacity_min": 0.1,
                  "sync": false
              }
          },
          "size": {  // 原子大小
              "value": 8,
              "random": true, // 随机大小
              "anim": { // 大小动画
                  "enable": false,
                  "speed": 50,
                  "size_min": 1,
                  "sync": false
              }
          },
          "line_linked": { // 连接线
              "enable": true,
              "distance": 500, // 连接线距离
              "color": "#888888",
              "opacity": 0.3,
              "width": 1
          },
          "move": { // 原子移动
              "enable": true,  
              "speed": 3, // 移动速度
              "direction": "none", // 原子移动方向 为none就随机
              "random": true, // 随机移动方向 没大意义
              "straight": false,  // 直接移动
              "out_mode": "out",  // 是否溢出画布
              "attract": { // 原子间吸引力
                  "enable": false,
                  "rotateX": 600,
                  "rotateY": 1200
              }
          }
      },
      "interactivity": {  //  原子之间互动检测
          "detect_on": "canvas", // "canvas", "window"
          "events": { 
              "onhover": {
                  "enable": false,  // 悬停
                  "mode": "grab" // 悬停模式 
              },
              "onclick": {
                  "enable": false, // 点击效果
                  "mode": "push"
              },
              "resize": true // 互动事件调整
          },
          "modes": {
              "grab": {
                  "distance": 400,  // 原子互动抓取距离
                  "line_linked": {
                      "opacity": 0.4 // 原子互动抓取距离连线不透明度
                  }
              },
              "bubble": {  // 原子抓取泡沫效果之间的距离
                  "distance": 400, // 距离
                  "size": 9,
                  "duration": 2, // 原子抓取泡沫效果之间的持续事件
                  "opacity": 0.3,
                  "speed": 2
              },
              "repulse": {  // 击退效果距离
                  "distance": 200
              },
              "push": {  // 粒子推出的数量
                  "particles_nb": 4
              },
              "remove": {
                  "particles_nb": 2
              }
          }
      },
      "retina_detect": true,
      "config_demo": {
          "hide_card": false,
          "background_color": "#b61924",
          "background_image": "",
          "background_position": "50% 50%",
          "background_repeat": "no-repeat",
          "background_size": "cover"
      }
  }
);