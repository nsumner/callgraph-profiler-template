#!/usr/bin/env python3

from collections import defaultdict


def get_row_tuples(instream):
    return (tuple(col.strip() for col in line.split(',')) for line in instream)


def read_callgraph(instream):
    nodes = set()
    edges = defaultdict(lambda : defaultdict(list))
    for (caller, filename, line, callee, count) in get_row_tuples(instream):
        nodes.add(caller)
        nodes.add(callee)
        edges[caller][(filename,line)].append((callee, count))
    return (nodes, edges)


def count_iterator(edges):
    return (int(count) for site in edges.values()
                       for target in site.values()
                       for callee, count in target)


def print_callgraph(callgraph):
    nodes, edges = callgraph
    print('digraph {\n  node [shape=record];')

    max_count = float(max(count_iterator(edges)))

    for node in nodes:
        sitemap   = edges[node]
        callsites = ''.join('|<l{0}>{1}:{2}'.format(id, filename, line)
                          for id, (filename,line) in enumerate(sitemap.keys()))
        node_format = '  "{0}"[label=\"{{{0}{1}}}\"];'
        print(node_format.format(node, callsites))

        for id, site in enumerate(sitemap.keys()):
            for (target,count) in sitemap[site]:
                count  = int(count)
                weight = round(max(1, min(count, 5 * (count / max_count))), 2)
                color  = hex(int(255 * (count / max_count)))[2:]
                styles = [
                    'label="{0}"'.format(count),
                    'penwidth="{0}"'.format(weight),
                    'labelfontcolor=black',
                    'color="#{0}0000"'.format(color)
                ]
                edge = (node, id, target, ','.join(styles))
                print('  "{0}":l{1} -> "{2}" [{3}];'.format(*edge))

    print('}')


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('csv', nargs='?', default=None,
                        help='the CSV format callgraph to transform')
    args = parser.parse_args()

    import sys
    with (open(args.csv) if args.csv else sys.stdin) as infile:
        callgraph = read_callgraph(infile)
    print_callgraph(callgraph)

