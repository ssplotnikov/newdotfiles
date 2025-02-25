local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local ls_utils = require("dev.snippets.utils.init")

local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local s = ls.s
local d = ls.dynamic_node
local f = ls.function_node

-- Keymaps
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/dev/plugins/snippets.lua<CR>", {})
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Snippets
ls.add_snippets("all", {
	s("date", {
		f(function()
			return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
		end, {}),
	}),
	s("todo", {
		c(1, {
			t("TODO: (gonza) - "),
			t("NOTE: (gonza) - "),
			t("FIX: (gonza) - "),
			t("WARNING: (gonza) - "),
			t("HACK: (gonza) - "),
			t("PERF: (gonza) - "),
		}),
	}),
	s({ trig = "id", name = "import default" }, fmt('import {} from "{}"\n{}', { i(2), i(1), i(0) })),
	s({ trig = "ia", name = "import all" }, fmt('import * as {} from "{}"\n{}', { i(2), i(1), i(0) })),
	s({ trig = "in", name = "import named" }, fmt('import {{ {} }} from "{}"\n{}', { i(2), i(1), i(0) })),
	s({ trig = "im", name = "import module" }, fmt('import "{}"\n{}', { i(1), i(0) })),

	s({ trig = "en", name = "export named" }, fmt("export {{\n  {}\n}}", { i(0) })),
	s({ trig = "ed", name = "export default" }, fmt("export default {}", { i(0) })),

	s({ trig = "el", name = "event listener" }, fmt('{}.eventListener("{}", {})\n{}', { i(1), i(2), i(3), i(0) })),
	s(
		{ trig = "ef", name = "fire event" },
		fmt('{}.dispatchEvent(new Event("{}", {{\n  {}\n}}))\n{}', { i(1), i(2), i(3), i(0) })
	),

	s({ trig = "wf", name = "witchcraft file" }, {
		t({ '// @include "./utils/addAttributes.js"', "" }),
		t({ "", "" }),
		t({ "(function main() {{", "\t" }),
		t({ "(setInterval(() => {{", "\t\t" }),
		i(0),
		t({ "", "\t" }),
		t({ "}}, 1000)", "" }),
		t({ ")()" }),
	}),
	s(
		{ trig = "wb", name = "witchcraft button" },
		fmt('addAttributes({{\n  query: "{}",\n  attributes: {{ role: "button" }},\n}})\n{}', { i(1), i(0) })
	),

	s({ trig = "of", name = "object field" }, fmt("{}: {}{},\n{}", { i(1), i(2), rep(1), i(0) })),

	s({ trig = "lf", name = "format string" }, fmt("JSON.stringify({}, null, 2){}", { i(1), i(0) })),
	s({ trig = "ll", name = "log" }, fmt("console.log({})\n{}", { i(1), i(0) })),
	s({ trig = "le", name = "log error" }, fmt("console.error({})\n{}", { i(1), i(0) })),
	s(
		{ trig = "lc", name = "log count" },
		fmt(
			[[
console.count({})
{}
  ]],
			{ i(1), i(0) }
		)
	),

	s({ trig = "li", name = "log info" }, fmt("console.info({})\n{}", { i(1), i(0) })),
	s({ trig = "lt", name = "log table" }, fmt("console.table({}, [{}])", { i(1), i(0) })),

	s(
		{ trig = "doc", name = "jsdoc" },
		fmt(
			[[
/**
 * {}
 */
  ]],
			{ i(0) }
		)
	),

	s({ trig = "ok", name = "Object.keys" }, fmt("Object.keys({}){}", { i(1), i(0) })),
	s({ trig = "ov", name = "Object.values" }, fmt("Object.values({}){}", { i(1), i(0) })),

	s({ trig = "vl", name = "let" }, fmt("let {} = {}\n{}", { i(1), i(2), i(0) })),
	s({ trig = "vc", name = "const" }, fmt("const {} = {}\n{}", { i(1), i(2), i(0) })),
	s({ trig = "vd", name = "destructure" }, fmt("const {{ {} }} = {}\n{}", { i(1), i(2), i(0) })),

	s({ trig = "fi", name = "inline function" }, fmt("({}) => {}", { i(1), i(0) })),
	s(
		{ trig = "fd", name = "function definition" },
		fmt("function {}({}) {{\n  return ({})\n}}\n\n{}", { i(1), i(2), i(3, "null"), i(0) })
	),
	s(
		{ trig = "fa", name = "arrow function" },
		fmt("const {} = ({}) => {{\n  return ({})\n}}\n\n{}", { i(1), i(2), i(3, "null"), i(0) })
	),

	s(
		{ trig = "afa", name = "async arrow function" },
		fmt("const {} = async ({}) => {{\n  return ({})\n}}", {
			i(1),
			i(2, "_args"),
			i(0, "null"),
		})
	),

	s(
		{ trig = "st", name = "set timeout" },
		fmt("setTimeout(() => {{\n  {}\n}}, {})\n\n{}", { i(1), i(2, "1000"), i(0) })
	),
	s(
		{ trig = "si", name = "set interval" },
		fmt("setInterval(() => {{\n  {}\n}}, {})\n\n{}", { i(1), i(2, "1000"), i(0) })
	),

	s({ trig = "qt", name = "gql tag" }, fmt("const {} = gql```\n{}\n```\n\n{}", { i(1), i(2), i(0) })),
	s(
		{ trig = "qr", name = "graphql resolver" },
		fmt("const {} = async ({}, {}, {}, {}) => {{\n  return ({})\n}}", {
			i(1),
			i(2, "_parent"),
			i(3, "_args"),
			i(4, "_context"),
			i(5, "_info"),
			i(0, "null"),
		})
	),

	s({ trig = "ci", name = "if statement" }, fmt("if ({}) {{\n  {}\n}}\n\n{}", { i(1), i(2), i(0) })),
	s({ trig = "cei", name = "else if statement" }, fmt("else if ({}) {{\n  {}\n}}\n\n{}", { i(1), i(2), i(0) })),
	s({ trig = "ce", name = "else statement" }, fmt("else {{\n  {}\n}}\n\n{}", { i(1), i(0) })),
	s({ trig = "cw", name = "while statement" }, fmt("if ({}) {{\n  {}\n}}\n\n{}", { i(1), i(2), i(0) })),
	s(
		{ trig = "ct", name = "try / catch" },
		fmt("try {{\n  {}\n}} catch {}{{\n  {}\n}}\n\n{}", { i(1), i(2), i(3), i(0) })
	),
	s(
		{ trig = "cs", name = "switch statement" },
		fmt("switch ({}) {{\n  case {}: {{\n    {}\n    break\n  }}\n  {}\n}}\n{}", { i(1), i(2), i(3), i(4), i(0) })
	),
	s({ trig = "cc", name = "switch case" }, fmt("case {}: {{\n  {}\n  break\n}}\n{}", { i(1), i(2), i(0) })),
	s({ trig = "cd", name = "default case" }, fmt("default: {{\n  {}\n}}", { i(0) })),
	s({ trig = "cf", name = "for each" }, fmt("for (const {} of {}) {{\n  {}\n}}\n\n{}", { i(1), i(2), i(3), i(0) })),
	s(
		{ trig = "cfr", name = "for range" },
		fmt(
			"for (let {} = {}; {} < {}; {}{}) {{\n  {}\n}}\n\n{}",
			{ i(1), i(2, "0"), rep(1), i(3), rep(1), i(4, "++"), i(5), i(0) }
		)
	),

	s({ trig = "et", name = "ternary expression" }, fmt("{} ? ({}): ({}){}", { i(1), i(2), i(3), i(0) })),

	s(
		{ trig = "em", name = "map expression" },
		fmt(
			[[
{}.map(({}) => ({}))
  ]],
			{ i(1), i(2), i(3) }
		)
	),

	s({ trig = "tc", name = "type class" }, fmt("class {} {{\n  {}\n}}\n\n{}", { i(1), i(2), i(0) })),
	s({ trig = "an", name = "named argument" }, fmt("{} = {}{},\n{}", { i(1), i(2), rep(1), i(0) })),

	s(
		{ trig = "d3u", name = "d3 update" },
		fmt(
			[[
function update(data) {{
  // Update scales (if dependent on the data)
  {}

  // Join updated data to elements
  {}

  // Remove unwanted shapes (using the exit selection)
  {}

  // Update existing shapes in the DOM
  {}

  // Append the enter selection to the DOM
  {}
}}
  ]],
			{ i(1), i(2), i(3), i(4), i(0) }
		)
	),

	s(
		{ trig = "d3t", name = "d3 tween" },
		fmt(
			[[
function {}(_d: unknown) {{
  const i = d3.interpolate(0, x.bandwidth());

  return function tick(t: number) {{
    return i(t);
  }};
}}
  ]],
			{ i(0) }
		)
	),

	s(
		{ trig = "lbb", name = "log breakpoint" },
		fmt(
			[[
console.log("{}", JSON.stringify({{
  {}
}}, null, 2))
  ]],
			{ i(1), i(0) }
		)
	),

	s(
		{ trig = "lp", name = "log performance" },
		fmt(
			[[
console.log(`- {}: ${{performance.now()}}`);
  ]],
			{ i(0) }
		)
	),
})

ls.add_snippets("lua", {
	s(
		"req",
		fmt("local {} = require('{}')", {
			f(function(import_name)
				local parts = vim.split(import_name[1][1], ".", { plain = true })
				return parts[#parts] or ""
			end, { 1 }),
			i(1, "module"),
		})
	),
})

local ret_filename = function()
	return vim.fn.expand("%:t:r:r")
end

local typescript_snippets = {
	s("tdc", {
		t("import type { FC } from 'react';"),
		t({ "", "" }),
		t({ "", "" }),
		t("export type "),
		f(ret_filename, {}),
		t("ComponentType = FC<"),
		f(ret_filename, {}),
		t("ComponentProps>;"),
		t({ "", "" }),
		t("export type "),
		f(ret_filename, {}),
		t("ComponentProps = {"),
		i(1),
		t("};"),
	}),

	s(
		"lg",
		fmt("console.log('logging {}: ', {})", {
			f(function(import_name)
				local parts = vim.split(import_name[1][1], ".", { plain = true })
				return parts[#parts] or ""
			end, { 1 }),
			i(1),
		})
	),
	s("func", {
		c(1, {
			fmt(
				[[function {}({}) {{
  {}
}}]],
				{ i(1), i(2), i(3) }
			),
			fmt(
				[[async function {}({}) {{
  {}
}}]],
				{ i(1), i(2), i(3) }
			),
		}),
	}),
	s({ trig = "at", name = "typed argument" }, fmt("{}: {},\n{}", { i(1), i(2), i(0) })),

	s({ trig = "ti", name = "interface" }, fmt("type {} = {{\n  {}\n}}\n\n{}", { i(1), i(2), i(0) })),

	s(
		{ trig = "tef", name = "function type" },
		fmt(
			[[
({}) => void;
{}
]],
			{ i(1), i(0) }
		)
	),

	s(
		{ trig = "ten", name = "number type" },
		fmt(
			[[
{}: number;
{}
  ]],
			{ i(1), i(0) }
		)
	),

	s(
		{ trig = "bp", name = "breakpoint" },
		fmt(
			[[
// eslint-disable-next-line
debugger;
  ]],
			{}
		)
	),

	s(
		{ trig = "tpp", name = "type pretty print" },
		fmt(
			[[
type Prettify<T> = {{
  [K in keyof T]: T[K];
}} & {{}}
{}
  ]],
			{ i(0) }
		)
	),

	s(
		{ trig = "dg", name = "mock data generator" },
		fmt(
			[[
const mock{} = (overrides?: Partial<{}>): {} => {{
  return {{
    {},
    ...overrides,
  }}
}}
  ]],
			{ rep(1), rep(1), i(1), i(0) }
		)
	),
}

local react_snippets = {
	s(
		{ trig = "hs", name = "useState hook" },
		fmt(
			[[
const [{}, set{}] = useState({});
{}
]],
			{ i(1), ls_utils.capitalize(2, 1), i(3), i(0) }
		)
	),

	s(
		{ trig = "hr", name = "useReducer hook" },
		fmt(
			[[
const [{{ {} }}, dispatch] = useReducer(reducer, {{ {} }});
{}
]],
			{ i(1), i(2), i(0) }
		)
	),

	s(
		{ trig = "hl", name = "useLayoutEffect hook" },
		fmt(
			[[
useLayoutEffect(() => {{
  {}
}}, [{}]);

{}
]],
			{ i(1), i(2), i(0) }
		)
	),

	s(
		{ trig = "hc", name = "useCallback hook" },
		fmt(
			[[
const {} = useCallback(({}) => {{
  {}
}}, [{}]);

{}
]],
			{ i(1), i(2), i(3), i(4), i(0) }
		)
	),

	s(
		{ trig = "hcon", name = "useContext hook" },
		fmt(
			[[
const {{{}}} = useContext({}Context);
{}
]],
			{ i(2), i(1), i(0) }
		)
	),

	s(
		{ trig = "hm", name = "useMemo" },
		fmt(
			[[
const {} = useMemo(({}) => {{
  {}
}}, [{}]);

{}
]],
			{ i(1), i(2), i(3), i(4), i(0) }
		)
	),

	s("hh", {
		fmt(
			[[
const {} = use{}({});
{}
]],
			{ i(3), i(1), i(2), i(0) }
		),
	}),

	s("he", {
		fmt("useEffect(() => {{\n  {}\n}}, [{}])\n\n{}", { i(1), i(2), i(0) }),
	}),
	s("rc", {
		c(1, {
			fmt(
				[[export const {} = () => {{
  return <div />{}
}}]],
				{ i(1), i(2) }
			),
			fmt(
				[[export type Props = {{
  {}
}}

export const {} = ({{{}}}: Props) => {{
  return <div />{}
}}]],
				{ i(1), i(2), i(3), i(4) }
			),
		}),
	}),
	s(
		{ trig = "rf", name = "react file" },
		fmt(
			"type {}Props = {{\n  {}\n}}\n\nconst {} = ({{{}}}: {}Props) => {{\n  return ({})\n}}\n\nexport default {}",
			{ rep(1), i(2), i(1), i(3), rep(1), i(0, "null"), rep(1) }
		)
	),
	s(
		{ trig = "rc", name = "react component" },
		fmt(
			"type {}Props = {{\n  {}\n}}\n\nconst {} = ({{{}}}: {}Props) => {{\n  return ({})\n}}",
			{ rep(1), i(2), i(1), i(3), rep(1), i(0, "null") }
		)
	),

	s(
		{ trig = "debugp", name = "debug props" },
		fmt(
			[[
function logPropDifferences(
  newProps: Record<string, any>,
  lastProps: Record<string, any>
  ) {{
    const allKeys = new Set([
    ...Object.keys(newProps),
    ...Object.keys(lastProps),
    ]);

    allKeys.forEach((key) => {{
      const newValue = newProps[key];
      const lastValue = lastProps?.[key];
      if (newValue !== lastValue) {{
        console.log(`New Value (${{key}}): `, newValue);
        console.log(`Last Value (${{key}}): `, lastValue);
      }}
    }});
  }}

function useDebugPropChanges(newProps: Record<string, any>) {{
  const lastProps = useRef<Record<string, any>>();
  const counters = useMemo(() => {{
    return {{ count: 0 }};
  }}, []);

  console.log(`======= RENDER {} ${{counters.count++}} ========`);

  if (lastProps.current) {{
    logPropDifferences(newProps, lastProps.current);
  }}

  lastProps.current = newProps;
}}

const {} = props
useDebugPropChanges(props)
]],
			{ d(1, {}), i(0) }
		)
	),

	s(
		{ trig = "rconf", name = "react context file" },
		fmt(
			[[
import {{ createContext, useContext }} from "react";

type {}ContextType = {{
  {}
}};

const {}Context = createContext<{}ContextType>(null as any);

const useProvide{} = (): {}ContextType => {{
  return {{}};
}};

export const Provide{} = ({{ children }}: any) => {{
  const value = useProvide{}();

  return (
    <{}Context.Provider value={{value}}>
      {{children}}
    </{}Context.Provider>
  );
}};

export const use{} = () => {{
  return useContext({}Context);
}};
  ]],
			{
				i(1),
				i(0),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
				rep(1),
			}
		)
	),

	s("izod", t("import {z} from 'zod'")),
}

local merged_snippets = {}
for _, v in ipairs(typescript_snippets) do
	table.insert(merged_snippets, v)
end

for _, v in ipairs(react_snippets) do
	table.insert(merged_snippets, v)
end

ls.add_snippets("typescript", typescript_snippets)
ls.add_snippets("javascript", typescript_snippets)
ls.add_snippets("typescriptreact", merged_snippets)
ls.add_snippets("javascriptreact", merged_snippets)
