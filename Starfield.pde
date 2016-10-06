Particle [] particles;
void setup()
{
	size(800, 800);
	background(0);
	particles = new Particle[400];
	for(int i = 0; i < 300; i ++)
	{
		particles[i] = new NormalParticle();
	}
	for(int i = 300; i < 395; i ++)
	{
		particles[i] = new JumboParticle();		
	}
	for(int i = 395; i < 400; i++)
	{
		particles[i] = new OddballParticle();
	}

}

void draw()
{
	background(0);
	for(int i = 0; i < particles.length; i++)
	{
		particles[i].move();
		particles[i].show();		
	}
}

void mousePressed()
{
	for(int i = 0; i < particles.length; i ++)
	{
		particles[i].click();
	}
}

class NormalParticle implements Particle
{
	int myColor, changeColor, cRed, cGreen, cBlue, cRainbow;
	double dX, dY, dSpeed, dTheta;
	NormalParticle()
	{
		dX = 400;
		dY = 400;
		dTheta = Math.random()*(2*Math.PI);
		dSpeed = (Math.random()*11)+1;
		changeColor = -1;
		myColor = (255);
		cRainbow = color((int)(Math.random()*255)+100, (int)(Math.random()*255)+100, (int)(Math.random()*255)+100);
		cRed = color(255, (int)(Math.random()*255)+100, (int)(Math.random()*255)+100);
		cGreen = color((int)(Math.random()*255)+100, 255, (int)(Math.random()*255)+100);
		cBlue = color((int)(Math.random()*255)+100, (int)(Math.random()*255)+100, 255);
	}

	public void move()
	{
		dX = Math.cos(dTheta) * dSpeed + dX;
		dY = Math.sin(dTheta) * dSpeed + dY;
	}

	public void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 5, 5);
	}

	public void click()
	{
		dX = mouseX;
		dY = mouseY;
		changeColor ++;
		if(changeColor > 3)
		{
			changeColor = 0;
		}		
		if(changeColor == 0)
		{
			myColor = cRainbow;
		}
		if(changeColor == 1)
		{
			myColor = cRed;
		}
		if(changeColor == 2)
		{
			myColor = cGreen;
		}
		if(changeColor == 3)
		{
			myColor = cBlue;
		}
	}
}

interface Particle
{
	public void show();
	public void move();
	public void click();
}

class OddballParticle implements Particle//uses an interface
{
	double dX, dY, dTheta, dSpeed;
	OddballParticle()
	{
		dX = (int)(Math.random()*700);
		dX = (int)(Math.random()*700);
		dTheta = Math.random()*(2*Math.PI);
		dSpeed = Math.random()*15 + 5;
	}

	public void show()
	{
		noStroke();
		fill((int)(Math.random()*255)+100, (int)(Math.random()*255)+100, (int)(Math.random()*255)+100);
		ellipse((float)dX,(float)dY, 10, 10);
	}

	public void move()
	{
		dX = Math.cos(dTheta) * dSpeed + dX;
		dY = Math.sin(dTheta) * dSpeed + dY;
		if(dX > 800 || dX < 0)
		{
			dSpeed = dSpeed * -1;
		}
		if(dY > 800 || dY < 0)
		{
			dSpeed = dSpeed * -1;
		}
	}

	public void click()
	{
		dX = (int)(Math.random()*700)+100;
		dY = (int)(Math.random()*700)+100;
	}
}

class JumboParticle extends NormalParticle//uses inheritance
{
	JumboParticle()
	{}
	
	void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 10, 10);
	}
}