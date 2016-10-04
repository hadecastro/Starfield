//your code here
Particle [] particles;
void setup()
{
	//your code here
	size(800, 800);
	background(0);
	particles = new Particle[50];
	for(int i = 0; i < 30; i ++)
	{
		particles[i] = new NormalParticle();
	}
	for(int i = 30; i < 40; i ++)
	{
		particles[i] = new JumboParticle();		
	}
	for(int i = 40; i < 50; i++)
	{
		particles[i] = new OddballParticle();
	}

}
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < 50; i++)
	{
		particles[i].move();
		particles[i].show();		
	}
}

void mousePressed()
{
	for(int i = 0; i < particles.length; i ++)
	{
		particles[i].middle();
	}
}

class NormalParticle implements Particle
{
	//your code here
	int myColor;
	double dX, dY, dSpeed, dTheta;
	NormalParticle()
	{
		dX = 400;
		dY = 400;
		dTheta = Math.random()*(2*Math.PI);
		dSpeed = Math.random()*11;
		myColor = color((int)(Math.random()*255)+100, (int)(Math.random()*255)+100, (int)(Math.random()*255)+100);
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

	public void middle()
	{
		dX = mouseX;
		dY = mouseY;
	}
}
interface Particle
{
	public void show();
	public void move();
	public void middle();
}
class OddballParticle implements Particle//uses an interface
{
	//your code here
	double dX, dY, dTheta, dSpeed;
	OddballParticle()
	{
		dX = (int)(Math.random()*700);
		dX = (int)(Math.random()*700);
		dTheta = Math.random()*(2*Math.PI);
		dSpeed = Math.random()*15;
	}
	public void show()
	{
		noStroke();
		fill(255);
		ellipse((float)dX,(float)dY, 15, 15);
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

	public void middle()
	{
		dX = (int)(Math.random()*700)+100;
		dY = (int)(Math.random()*700)+100;
	}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	JumboParticle()
	{
	}
	void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 10, 10);
	}
}

