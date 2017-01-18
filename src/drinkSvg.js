const Snap = require('imports-loader?this=>window,fix=>module.exports=0!snapsvg/dist/snap.svg.js');
let s = Snap('#drink-svg');

const viewbox = 100;

// user-specified dimensions as fractions of
const userDim = {
   width: .5,
   height: 1,
   base: .15,
   thickness: .03,
   pad: .02,
   room: .1
};

// calculated dimensions based on viewbox size
const calcDim = {
	width: userDim.width * viewbox,
   height: userDim.height * viewbox,
   base: userDim.base * viewbox,
   thickness: userDim.thickness * viewbox,
   pad: userDim.pad * viewbox,
   room: userDim.room * viewbox
}

// calculated coordinates
const bounds = {
   left: (viewbox - calcDim.width) / 2,
   top: (viewbox - calcDim.height) / 2,
   right: viewbox - (viewbox - calcDim.width) / 2,
   bottom: viewbox - (viewbox - calcDim.height) / 2
};
const inside = {
   left: bounds.left + calcDim.thickness,
   right: bounds.right - calcDim.thickness,
   bottom: bounds.bottom - calcDim.base
};
const drink = {
   left: inside.left + calcDim.pad,
   top: bounds.top + calcDim.room,
   right: inside.right - calcDim.pad,
   bottom: inside.bottom - calcDim.pad
};

const getGlassPoly = () => {
   return [bounds.left, bounds.top, bounds.left, bounds.bottom, bounds.right, bounds.bottom, bounds.right, bounds.top,
      inside.right, bounds.top, inside.right, inside.bottom, inside.left, inside.bottom, inside.left, bounds.top
   ];
};

const getTopYDim = (index, fractions, usableHeight) => {
	console.log('drink.top: ' + drink.top);
	const fracUsed = fractions.slice(0, index).reduce((a,b) => a+b, 0); console.log('frac used: ' + fracUsed);
   const actualUsed = usableHeight * fracUsed + index * calcDim.pad; console.log('actual used: ' + actualUsed);
	return drink.top + actualUsed;
};

const getIngredientPolys = (fractions) => {
	const n = fractions.length;
	const h = drink.bottom - drink.top - (n-1)*calcDim.pad; // total usable height
	return fractions.map((f, i) => {
   	const top =  getTopYDim(i, fractions, h);
      const bottom = top + f*h;
   	return [ drink.left, top, drink.left, bottom, drink.right, bottom, drink.right, top, drink.left, top ];
   });
};

const display = (fractions) => {
  if (!s) {
    s = Snap('#drink-svg');
  }

  s.clear();

  const glass = s.polygon(getGlassPoly());
  glass.attr({
     class: 'glass'
  });

  //const squarePattern = s.rect(0, 0, 1, 1).attr({fill: '#28587B'}).pattern(0, 0, 1.5, 1.5);
  const polys = getIngredientPolys(fractions.sort((a, b) => a - b));
  for (let i = 0; i < polys.length; i++) {
    let ing = s.polygon(polys[i].map(p => Math.round(p)));
     ing.attr({
      class: 'ingredient',
        //fill: squarePattern
     });
  }
}

module.exports = {
  display: display
}
