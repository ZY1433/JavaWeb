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
    let count = 60;

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
};
//

//以上内容主要借鉴自
// 掘金剪影变粒子https://juejin.cn/post/7054488650410622984#heading-1
// 跨域问题1 https://blog.csdn.net/Treeee_/article/details/111996118
// 跨域问题2 https://blog.csdn.net/G294992891/article/details/109279415?utm_medium=distribute.pc_category.none-task-blog-hot-11.nonecase&depth_1-utm_source=distribute.pc_category.none-task-blog-hot-11.nonecase
//但是修正看内容让其可以实际运行，跨域问题其实没有解决，还是时有时无