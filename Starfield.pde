//your code here
Particle [] particles;
void setup()
{
	//your code here
	size(500, 500);
	background(0);
	particles = new Particle[50];
	for(int i = 0; i < particles.length; i ++)
	{
		particles[i] = new NormalParticle();
	}
	for(int i = 10; i < 20; i ++)
	{
		particles[i] = new OddballParticle();
	}

	for(int i = 20; i < 25; i ++)
	{
		particles[i] = new JumboParticle();		
	}

}
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < particles.length; i++)
	{
		particles[i].move();
		particles[i].show();		
	}
	for(int i = 10; i < 20; i ++)
	{
		particles[i].show();
	}
	for(int i = 20; i < 25; i ++)
	{
		particles[i].show();
		particles[i].move();		
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
		dX = 250;
		dY = 250;
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
	int dX, dY;
	OddballParticle()
	{
		dX = 100;
	}
	public void show()
	{
		noStroke();
		fill(255);
		ellipse(200, 200, 10, 10);
	}

	public void move()
	{

	}

	public void middle()
	{
		dX = (int)(Math.random()*300)+100;
		dY = (int)(Math.random()*300)+100;
	}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 10, 10);
	}
}

