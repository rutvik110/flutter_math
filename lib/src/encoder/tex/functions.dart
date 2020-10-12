library tex_encoder_functions;

import '../../ast/nodes/accent.dart';
import '../../ast/nodes/frac.dart';
import '../../ast/nodes/left_right.dart';
import '../../ast/nodes/style.dart';
import '../../ast/nodes/symbol.dart';
import '../../ast/options.dart';
import '../../ast/size.dart';
import '../../ast/style.dart';
import '../../ast/symbols/symbols_composite.dart';
import '../../ast/syntax_tree.dart';
import '../../ast/types.dart';
import '../../parser/tex/accents.dart';
import '../../parser/tex/font.dart';
import '../../parser/tex/functions.dart';
import '../../parser/tex/symbols.dart';
import '../../utils/alpha_numeric.dart';
import '../../utils/iterable_extensions.dart';
import '../../utils/unicode_literal.dart';
import '../encoder.dart';
import '../matcher.dart';
import '../optimization.dart';
import 'encoder.dart';

part 'functions/accent.dart';
part 'functions/accent_under.dart';
part 'functions/frac.dart';
part 'functions/style.dart';
part 'functions/symbol.dart';

const Map<Type, EncoderFun> encoderFunctions = {
  EquationRowNode: _equationRowNodeEncoderFun,
  // AccentNode: _accentEncoder,
  // FracNode: _fracEncoder,
  SymbolNode: _symbolEncoder,
  StyleNode: _styleEncoder,
};

EncodeResult _equationRowNodeEncoderFun(GreenNode node) =>
    EquationRowTexEncodeResult(
        node.children.map(encodeTex).toList(growable: false));

final optimizationEntries = <OptimizationEntry>[
  // ..._fracOptimizationEntries,
]..sortBy<num>((entry) => -entry.priority);