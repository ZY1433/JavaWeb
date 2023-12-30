//背景粒子特效
window.onload = function () {
    // 获取canvas对象
    let canvas = document.getElementById("canvas");

    // 获取画笔
    let ctx = canvas.getContext("2d");

    // 设置canvas宽高
    canvas.height = innerHeight;
    canvas.width = innerWidth;
    // 定义一个粒子数组
    let particlesArray = [];
    // 定义页面内粒子的数量
    let count = 20;

    // 定义粒子类
    class Particle {
        constructor(x, y) {
            this.x = x;
            this.y = y;
            // x，y轴的移动速度  -0.5 -- 0.5
            this.directionX = Math.random() - 0.5;
            this.directionY = Math.random() - 0.5;
        }

        // 更新点的坐标
        update() {
            this.x += this.directionX;
            this.y += this.directionY;
        }

        // 绘制粒子
        draw() {
            ctx.beginPath();
            ctx.arc(this.x, this.y, 2, 0, Math.PI * 2);
            ctx.closePath();
            ctx.fillStyle = "#ffffff";
            ctx.fill();
        }
    }

    // 创建粒子
    function createParticle() {
        // 生成一个点的随机坐标
        let x = Math.random() * innerWidth;
        let y = Math.random() * innerHeight;

        particlesArray.push(new Particle(x, y));
    }

    // 处理粒子
    // 先更新坐标，再绘制出来
    function handleParticle() {
        for (let i = 0; i < particlesArray.length; i++) {
            let particle = particlesArray[i];
            particle.update();
            particle.draw();
            // 超出范围就将这个粒子删除
            if (
                particle.x < 0 ||
                particle.x > canvas.width ||
                particle.y < 0 ||
                particle.y > canvas.height
            ) {
                particlesArray.splice(i, 1);
            }
        }
    }

    function draw() {
        // 首先清空画布
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        // 如果粒子数量小于规定数量，就生成新的粒子
        if (particlesArray.length < count) {
            createParticle();
        }
        // 处理粒子
        handleParticle();
    }

    // 设置定时器
    setInterval(draw, 10);

    {
        function draw2(id,url,gap,rgbmin,rgbmax,color,size,imgW,imgH) {
            const canvas = document.getElementById(id); //读取到幕布
            const ctx = canvas.getContext("2d"); //绘制2d样式
            const img = new Image(); //新建一个图片对象
            img.src = url + "?" + new Date().getTime();

            img.setAttribute("crossOrigin", "Anonymous");

            let imgData = null; //存图片的像素
            let pointArr = []; //定义一个数组，用来存储点

            img.onload = function () {
                //图片加载时运行的
                // imgH = imgW * (img.height / img.width); //等比计算高度
                ctx.drawImage(img, 0, 0, imgW, imgH); //从画布00位置画出图像
                imgData = ctx.getImageData(0, 0, imgW, imgH).data; //得到这个图像的所有位置的rgba信息
                ctx.clearRect(0, 0, canvas.width, canvas.height); //这里是把幕布先清空
                // console.log(imgData); //看看有没有获取到信息用的
                pointInit(imgData); //用来确定哪些位置有点
                move();
            };

            function pointInit(imgData) {
                for (var h = 0; h < imgH; h += gap) {
                    for (var w = 0; w < imgW; w += gap) {
                        //遍历每个位置
                        var position = (imgW * h + w) * 4; //因为data是把矩阵排列一个长数组，每个位置有rgba4个元素，所以这样可以算出这个点在数组里的位置
                        var r = imgData[position],
                            g = imgData[position + 1],
                            b = imgData[position + 2]; //读取每个点的rgb

                        if (r + g + b >= rgbmin && r + g + b <= rgbmax) {
                            //这里是判断什么时候加点，要根据图片颜色改（从0到765越来越白）
                            pointArr.push(new Point(size, w, h)); //在数组里添加一个点(1是点的大小可以改)
                        }
                    }
                }
            }
            class Point {
                //定义点对象
                constructor(size, w, h) {
                    this.orw = w;
                    this.orh = h; // 保留图像初始位置，方便粒子聚合成图像

                    this.x = Math.random() * canvas.width;
                    this.y = Math.random() * canvas.height; // 随机位置
                    this.size = size; //点的大小
                    this.w = w;
                    this.h = h;
                    // 速度
                    this.spx = (w - this.x) / 2 / 20;
                    this.spy = (h - this.y) / 2 / 20;
                }

                update() {
                    // 圆点每次位置变化
                    this.spx = (this.w - this.x) / 40;
                    this.spy = (this.h - this.y) / 40; //这也是来当速度的，可以看作步长
                    if (Math.abs(this.w - this.x) <= Math.abs(this.spx)) {
                        this.x = this.w; //如果随机位置离实际位置小于步长，就相当于到位了
                    } else {
                        this.x += this.spx; //如果没到就加个步长
                    }
                    if (Math.abs(this.h - this.y) <= Math.abs(this.spy)) {
                        this.y = this.h;
                    } else {
                        this.y += this.spy;
                    }
                }
                // 渲染圆点
                rander() {
                    ctx.beginPath(); //开始画图
                    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2); //定义成圆点(其实画的是空心圆)
                    ctx.fillStyle = color; //点的颜色
                    ctx.fill(); //填充
                    ctx.closePath(); //停止绘图
                }
            }
            function move() {
                //点的移动
                ctx.clearRect(0, 0, canvas.width, canvas.height); //让点显现之后再消失，看着就像移动啦，删掉会留下轨迹，还挺有意思
                pointArr.forEach((point) => {
                    //遍历每个点
                    point.update(); //更新点的内容
                    point.rander(); //画图
                });

                // 代替setTimeout提升性能
                requestAnimationFrame(move); //我的理解是这就是循环吧，可以一直回代画出来每个点？
            }

        };
        let id = "slogan";
        let url = `./img/slogan.png`;
        let gap = 2;
        let rgbmin = 100;
        let rgbmax = 500;
        let color = "#555";
        let size = 2;
        let imgW = 300; //固定宽度
        let imgH = 140;
        draw2(id,url,gap,rgbmin,rgbmax,color,size,imgW,imgH)

        id = "Logo";
        url = `./img/img.png`;
        gap = 7;
        rgbmin = 100;
        rgbmax = 200;
        color = "#eee";
        size = 2;
        imgW = 550; //固定宽度
        imgH = 500;
        draw2(id,url,gap,rgbmin,rgbmax,color,size,imgW,imgH)
    }


    {
        let items = document.querySelectorAll(".item");//图片节点
        let points = document.querySelectorAll(".point")//点
        let left = document.getElementById("leftBtn");
        let right = document.getElementById("rightBtn");
        let all = document.querySelector(".wrap")
        let index = 0;
        let time = 0;//定时器跳转参数初始化


        //封装一个清除active方法
        let clearActive = function () {
            for (i = 0; i < items.length; i++) {
                items[i].className = 'item';
            }
            for (j = 0; j < points.length; j++) {
                points[j].className = 'point';
            }
        }

        //改变active方法
        let goIndex = function () {
            clearActive();
            items[index].className = 'item active';
            points[index].className = 'point active'
        }
        //左按钮事件
        let goLeft = function () {
            if (index === 0) {
                index = 4;
            } else {
                index--;
            }
            goIndex();
        }

        //右按钮事件
        let goRight = function () {
            if (index < 4) {
                index++;
            } else {
                index = 0;
            }
            goIndex();
        }


        //绑定点击事件监听
        left.addEventListener('click', function () {
            goLeft();
            time = 0;//计时器跳转清零
        })

        right.addEventListener('click', function () {
            goRight();
            time = 0;//计时器跳转清零
        })

        for (i = 0; i < points.length; i++) {
            points[i].addEventListener('click', function () {
                let pointIndex = this.getAttribute('data-index')
                index = pointIndex;
                goIndex();
                time = 0;//计时器跳转清零
            })
        }
        //计时器轮播效果
        let timer;

        function play() {
            timer = setInterval(() => {
                time++;
                if (time === 20) {
                    goRight();
                    time = 0;
                }
            }, 100)
        }

        play();
        //移入清除计时器
        all.onmousemove = function () {
            clearInterval(timer)
        }
        //移出启动计时器
        all.onmouseleave = function () {
            play();
        }
    }
}