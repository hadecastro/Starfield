//your code here
NormalParticle [] part;
void setup()
{
	//your code here
	size(500, 500);
	background(0);
	part = new NormalParticle[20];
	for(int i = 0; i < part.length; i ++)
	{
		part[i] = new NormalParticle();
	}
}
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < part.length; i++)
	{
		part[i].move();
		part[i].show();		
	}

}
class NormalParticle
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
		myColor = color((int)(Math.random()*255)+100, (int)(Math.random()*255)+100, 255);
	}

	void move()
	{
		dX = Math.cos(dTheta) * dSpeed + dX;
		dY = Math.sin(dTheta) * dSpeed + dY;
	}

	void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 5, 5);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

