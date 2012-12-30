require("Options")

module DataFrames

##############################################################################
##
## Dependencies
##
##############################################################################

using Base.Intrinsics
using OptionsMod

##############################################################################
##
## Global constants
##
##############################################################################

const DEFAULT_COLUMN_TYPE = Float64
const POOLED_DATA_VEC_REF_TYPE = Uint16
const POOLED_DATA_VEC_REF_CONVERTER = uint16

##############################################################################
##
## Overwritten and/or extended methods
##
##############################################################################

import Base.(!),
       Base.(!=),
       Base.($),
       Base.(&),
       Base.(.!=),
       Base.(.*),
       Base.(./),
       Base.(.<),
       Base.(.<=),
       Base.(.==),
       Base.(.^),
       Base.(*),
       Base.(+),
       Base.(-),
       Base.(/),
       Base.(<),
       Base.(<= ),
       Base.(==),
       Base.(>),
       Base.(>=),
       Base.(\),
       Base.(^),
       Base.abs,
       Base.acos,
       Base.acosh,
       Base.all,
       Base.any,
       Base.append!,
       Base.areduce,
       Base.asin,
       Base.asinh,
       Base.assign,
       Base.atan,
       Base.atan2,
       Base.atanh,
       Base.autocor,
       Base.BitArray,
       Base.BitMatrix,
       Base.bitpack,
       Base.BitVector,
       Base.bool,
       Base.box,
       Base.cat,
       Base.ceil,
       Base.check_bounds,
       Base.cmp,
       Base.conj!,
       Base.conj,
       Base.convert,
       Base.copy,
       Base.copy_to,
       Base.cor_pearson,
       Base.cor_spearman,
       Base.cos,
       Base.cosh,
       Base.cov_pearson,
       Base.cov_spearman,
       Base.ctranspose,
       Base.cummax,
       Base.cummin,
       Base.cumprod,
       Base.cumsum,
       Base.cumsum_kbn,
       Base.deepcopy,
       Base.del,
       Base.del_all,
       Base.diag,
       Base.diff,
       Base.digamma,
       Base.dist,
       Base.div,
       Base.done,
       Base.dot,
       Base.dump,
       Base.eig,
       Base.eltype,
       Base.enqueue,
       Base.erf,
       Base.erfc,
       Base.exp,
       Base.exp2,
       Base.expand,
       Base.expm1,
       Base.fft,
       Base.fill!,
       Base.fill,
       Base.filter,
       Base.find,
       Base.findn,
       Base.findn_nzs,
       Base.fld,
       Base.float,
       Base.floor,
       Base.gamma,
       Base.get,
       Base.grow,
       Base.has,
       Base.hcat,
       Base.iceil,
       Base.ifloor,
       Base.imag,
       Base.insert,
       Base.int,
       Base.intersect,
       Base.inverse_rle,
       Base.iqr,
       Base.iround,
       Base.isempty,
       Base.isequal,
       Base.isfinite,
       Base.isinf,
       Base.isless,
       Base.isnan,
       Base.isnan,
       Base.itrunc,
       Base.keys,
       Base.kurtosis,
       Base.length,
       Base.lgamma,
       Base.log,
       Base.log10,
       Base.log1p,
       Base.log2,
       Base.logb,
       Base.mad,
       Base.map,
       Base.map_to,
       Base.max,
       Base.max,
       Base.mean,
       Base.median,
       Base.min,
       Base.mod,
       Base.msync,
       Base.ndims,
       Base.next,
       Base.nnz,
       Base.nonzeros,
       Base.norm,
       Base.numel,
       Base.one,
       Base.order,
       Base.permute,
       Base.pop,
       Base.print,
       Base.prod,
       Base.promote,
       Base.promote_rule,
       Base.push,
       Base.read,
       Base.real,
       Base.ref,
       Base.reinterpret,
       Base.rem,
       Base.repl_show,
       Base.reshape,
       Base.reverse,
       Base.rle,
       Base.round,
       Base.shift,
       Base.show,
       Base.sign,
       Base.signif,
       Base.similar,
       Base.sin,
       Base.sinh,
       Base.size,
       Base.skewness,
       Base.sort,
       Base.sort_by,
       Base.sqrt,
       Base.square,
       Base.start,
       Base.std,
       Base.string,
       Base.sub,
       Base.sum,
       Base.svd,
       Base.tan,
       Base.tanh,
       Base.transpose,
       Base.trunc,
       Base.unbox,
       Base.union,
       Base.values,
       Base.var,
       Base.vcat,
       Base.write,
       Base.zeros,
       Base.|,
       Base.~

##############################################################################
##
## Exported methods and types
##
##############################################################################

export # reconcile_groups,
       @DataFrame,
       @transform,
       AbstractIndex,
       AbstractDataFrame,
       AbstractDataVec,
       any_na,
       array,
       based_on,
       between,
       by,
       cbind,
       clean_colnames!,
       colffts,
       colmaxs,
       colmeans,
       colmedians,
       colmins,
       colnames!,
       colnames,
       colnorms,
       colprods,
       colranges,
       colstds,
       colsums,
       coltypes,
       colvars,
       colwise,
       combine,
       complete_cases,
       cut,
       DataFrame,
       DataMatrix,
       DataStream,
       DataVec,
       describe,
       dmdiagm,
       dmeye,
       dmfalses,
       dmones,
       dmtrues,
       dmzeros,
       drop_duplicates!,
       duplicated,
       dvbool,
       dvfalses,
       dvfloat,
       dvint,
       dvones,
       dvtrues,
       dvzeros,
       each_failNA,
       each_removeNA,
       each_replaceNA,
       failNA,
       flipud!,
       flipud,
       Formula,
       get_groups,
       GroupApplied,
       groupby,
       GroupedDataFrame,
       head,
       in,
       Index,
       index,
       index_to_level,
       IndexedVec,
       Indexer,
       get_indices,
       interaction_design_matrix,
       is_group,
       isna,
       letters,
       LETTERS,
       level_to_index,
       levels,
       load_df,
       matrix,
       merge,
       model_frame,
       model_matrix,
       ModelFrame,
       ModelMatrix,
       NA,
       NAException,
       nafilter,
       naFilter,
       NamedArray,
       names!,
       nareplace,
       naReplace,
       nas,
       NAtype,
       ncol,
       nrow,
       pdvfalses,
       pdvones,
       pdvtrues,
       pdvzeros,
       percent_change,
       PooledDataVec,
       PooledDataVecs, # The capitalization and/or name for this is a bit inconsistent (merge_pools, maybe?). Do we want to export?
       print_table,
       range,
       rbind,
       read_minibatch,
       read_table,
       reldiff,
       removeNA,
       rename_group!,
       replace!,
       replace_names!,
       replace_names,
       replaceNA,
       rowffts,
       rowmaxs,
       rowmeans,
       rowmedians,
       rowmins,
       rownorms,
       rowprods,
       rowranges,
       rowstds,
       rowsums,
       rowvars,
       save,
       set_group,
       set_groups,
       SimpleIndex,
       stack,
       SubDataFrame,
       subset,
       table,
       tail,
       unique,
       unstack,
       vector,
       with,
       within!,
       within,
       without,
       write_table

##############################################################################
##
## Load files
##
##############################################################################

include(file_path(julia_pkgdir(), "DataFrames", "src", "utils.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "index.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "datavec.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "namedarray.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "dataframe.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "grouping.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "formula.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "io.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "datastream.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "datamatrix.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "linalg.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "operators.jl"))
include(file_path(julia_pkgdir(), "DataFrames", "src", "statistics.jl"))
# TODO: Get DataArray working
# include(file_path(julia_pkgdir(), "DataFrames", "src", "dataarray.jl"))
# TODO: Get indexing working
# include(file_path(julia_pkgdir(), "DataFrames", "src", "indexing.jl"))

# TODO: Remove these definitions
nafilter(x...) = error("Function removed. Please use removeNA")
nareplace(x...) = error("Function removed. Please use replaceNA")
naFilter(x...) = error("Function removed. Please use each_removeNA")
naReplace(x...) = error("Function removed. Please use each_replaceNA")

end # module DataFrames
