import 'package:flutter/material.dart';
import 'models/product.dart';
import 'models/types.dart';
const DUMMY_TYPES = const [
  Types(
    id: 't1',
    title: 'Shirts',
    color: Colors.purple,
  ),
  Types(
    id: 't2',
    title: 'Trousers',
    color: Colors.red,
  ),
  Types(
    id: 't3',
    title: 'Scarfs',
    color: Colors.orange,
  ),
  Types(
    id: 't4',
    title: 'Pans',
    color: Colors.amber,
  ),
];
const DUMMY_PRODUCT = const [
  Product(
      id: '1',
      types: [
        't1',
      ],
      title: 'Red Shirt',
      image: 'https://www.somersetworkwear.com/media/catalog/product/cache/b7a2a95d9a66018deddeba995b92ed53/1/0/100221_womans_red_polo_shirt_1080.jpg',
      price: 3000,
      description: 'Red shirt is an informal term for a stock character who is killed off shortly after being introduced. The term often implies that said character was introduced for the sole purpose of being killed off while adding little else to the story, and is sometimes used pejoratively to point out a redshirts lack of good characterization or the obviousness of their incoming demise. Redshirt deaths are often used to emphasize the potential peril faced by more important characters.'
  ),
  Product(
    id: '2',
    types: [
      't2'
    ],
    title: 'Nike Trousers',
    image: 'https://www.alexandra.co.uk/media/catalog/product/n/f/nf131_bk_front.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=700&width=700&canvas=700:700',
    price: 1400,
    description: 'Sometimes Also called pants. a usually loose-fitting outer garment for the lower part of the body, having individual leg portions that reach typically to the ankle but sometimes to any of various other points from the upper leg down.',
  ),
  Product(
      id: '3',
      types: [
        't3',
      ],
      title: 'Yellow Scarf',
      image: 'https://saarnigb.fi/cdn/shop/files/IF-SS560-1.jpg?v=1712160850',
      price: 2000,
      description: 'Yellow Scarf is a long, broad strip of wool, silk, lace, or other material worn about the neck, shoulders, or head, for ornament or protection against cold, drafts, etc. a necktie or cravat with hanging ends.'
  ),
  Product(
    id: '4',
    types: [
      't4',
    ],
    title: 'Glass Pan',
    image: 'https://firesidefoodshop.com/cdn/shop/products/orangejuice-1_667x.jpg?v=1586206372',
    price: 1600,
    description: 'Glass pans are slower to transfer heat, but retain that heat for longer than metal, which can cause edges and bottoms of baked goods to become hard and overdone by the time the center cooks through. We recommend you reduce your ovens temperature by 25°F when using a glass pan.',
  ),
];