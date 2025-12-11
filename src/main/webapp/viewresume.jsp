<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ghostly Resume Viewer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1a1a2e, #16213e, #0f3460);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        /* Animated background elements */
        .bg-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .floating-orb {
            position: absolute;
            width: 100px;
            height: 100px;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            border-radius: 50%;
            animation: floatOrb 15s infinite linear;
            filter: blur(10px);
        }

        .orb-1 { top: 10%; left: 5%; animation-delay: 0s; }
        .orb-2 { top: 60%; left: 80%; animation-delay: 3s; }
        .orb-3 { top: 30%; left: 90%; animation-delay: 6s; }

        @keyframes floatOrb {
            0%, 100% {
                transform: translate(0, 0);
                opacity: 0.3;
            }
            25% {
                transform: translate(50px, 30px);
                opacity: 0.5;
            }
            50% {
                transform: translate(30px, 50px);
                opacity: 0.3;
            }
            75% {
                transform: translate(-30px, 40px);
                opacity: 0.5;
            }
        }

        /* Main container */
        .view-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 
                0 10px 30px rgba(0, 0, 0, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            text-align: center;
            position: relative;
            z-index: 10;
            border: 1px solid rgba(255, 255, 255, 0.1);
            max-width: 500px;
            width: 90%;
            animation: fadeIn 1s ease-out;
            transition: all 0.3s ease;
        }

        .view-container:hover {
            transform: translateY(-5px);
            box-shadow: 
                0 15px 40px rgba(0, 0, 0, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Header section */
        .header {
            margin-bottom: 30px;
            position: relative;
        }

        .ghost-icon {
            font-size: 70px;
            margin-bottom: 15px;
            animation: ghostFloat 4s ease-in-out infinite;
            filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.5));
            color: #e3f2fd;
        }

        @keyframes ghostFloat {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        h1 {
            color: #e3f2fd;
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 600;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .subtitle {
            color: #bbdefb;
            font-size: 16px;
            max-width: 300px;
            margin: 0 auto;
            line-height: 1.5;
        }

        /* View button */
        .view-btn {
            background: linear-gradient(135deg, #42a5f5, #1e88e5);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 18px;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
            margin-top: 20px;
            box-shadow: 0 5px 15px rgba(30, 136, 229, 0.4);
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .view-btn:hover {
            background: linear-gradient(135deg, #1e88e5, #1565c0);
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(30, 136, 229, 0.6);
        }

        .view-btn:active {
            transform: translateY(0);
        }

        .view-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .view-btn:hover::before {
            left: 100%;
        }

        /* Ghost animation */
        .mini-ghost {
            position: absolute;
            font-size: 24px;
            animation: miniGhost 8s infinite linear;
            opacity: 0.7;
            z-index: 2;
        }

        .mini-ghost:nth-child(1) { top: 10%; left: 5%; animation-delay: 0s; }
        .mini-ghost:nth-child(2) { top: 80%; left: 85%; animation-delay: 2s; }
        .mini-ghost:nth-child(3) { top: 60%; left: 10%; animation-delay: 4s; }

        @keyframes miniGhost {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(20px, 15px) rotate(5deg);
            }
            50% {
                transform: translate(15px, 20px) rotate(0deg);
            }
            75% {
                transform: translate(-15px, 12px) rotate(-5deg);
            }
        }

        /* Stats section */
        .stats {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
            padding-top: 25px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: #bbdefb;
            display: block;
        }

        .stat-label {
            font-size: 12px;
            color: #90caf9;
            margin-top: 5px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .view-container {
                padding: 40px 30px;
            }
            
            h1 {
                font-size: 28px;
            }
            
            .ghost-icon {
                font-size: 60px;
            }
            
            .stats {
                flex-direction: column;
                gap: 15px;
            }
            
            .mini-ghost {
                display: none; /* Hide on mobile for better performance */
            }
        }

        /* Cursor effect */
        .ghost-cursor {
            position: fixed;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            pointer-events: none;
            z-index: 9999;
            mix-blend-mode: difference;
            animation: cursorPulse 2s ease-in-out infinite;
        }

        @keyframes cursorPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.2); }
        }
    </style>
</head>
<body>
    <!-- Background elements -->
    <div class="bg-elements">
        <div class="floating-orb orb-1"></div>
        <div class="floating-orb orb-2"></div>
        <div class="floating-orb orb-3"></div>
    </div>

    <!-- Mini ghosts -->
    <div class="mini-ghost">👻</div>
    <div class="mini-ghost">👻</div>
    <div class="mini-ghost">👻</div>

    <!-- Ghost cursor -->
    <div class="ghost-cursor" id="ghostCursor"></div>

    <!-- Main container -->
    <div class="view-container">
        <div class="header">
            <div class="ghost-icon">👻</div>
            <h1>Resume Viewer</h1>
            <p class="subtitle">Access your professional profile with our ghostly secure system</p>
        </div>

        <form action="viewresume" method="post">
            <button type="submit" class="view-btn">
                <i class="fas fa-file-alt"></i> View My Resume
            </button>
        </form>

        <div class="stats">
            <div class="stat-item">
                <span class="stat-number" id="resumeCount">0</span>
                <span class="stat-label">Resumes Created</span>
            </div>
            <div class="stat-item">
                <span class="stat-number" id="viewCount">0</span>
                <span class="stat-label">Times Viewed</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">100%</span>
                <span class="stat-label">Secure</span>
            </div>
        </div>
    </div>

    <script>
        // Ghost cursor movement
        document.addEventListener('mousemove', function(e) {
            const cursor = document.getElementById('ghostCursor');
            cursor.style.left = e.pageX + 'px';
            cursor.style.top = e.pageY + 'px';
        });

        // Animated counters
        function animateCounter(element, target, duration) {
            let start = 0;
            const increment = target / (duration / 16);
            const timer = setInterval(() => {
                start += increment;
                if (start >= target) {
                    element.textContent = target;
                    clearInterval(timer);
                } else {
                    element.textContent = Math.floor(start);
                }
            }, 16);
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            // Animate counters
            animateCounter(document.getElementById('resumeCount'), 24, 2000);
            animateCounter(document.getElementById('viewCount'), 156, 1500);

            // Add click effect to button
            const viewBtn = document.querySelector('.view-btn');
            viewBtn.addEventListener('click', function() {
                // Add ripple effect
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = 0;
                const y = 0;
                
                ripple.style.cssText = `
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.6);
                    transform: scale(0);
                    animation: ripple 0.6s linear;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                `;
                
                this.style.position = 'relative';
                this.style.overflow = 'hidden';
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });

            // Add ripple animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        });

        // Background color change on hover
        const container = document.querySelector('.view-container');
        container.addEventListener('mouseenter', function() {
            document.body.style.background = 'linear-gradient(135deg, #1a1a2e, #16213e, #0f3460, #1a1a2e)';
        });
        
        container.addEventListener('mouseleave', function() {
            document.body.style.background = 'linear-gradient(135deg, #1a1a2e, #16213e, #0f3460)';
        });
    </script>
</body>
</html>